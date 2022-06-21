Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB3F10E5
	for <linux-staging@lists.linux.dev>; Tue, 21 Jun 2022 15:42:19 +0000 (UTC)
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay13.hostedemail.com (Postfix) with ESMTP id DF469602B7;
	Tue, 21 Jun 2022 15:25:59 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf14.hostedemail.com (Postfix) with ESMTPA id C136633;
	Tue, 21 Jun 2022 15:25:58 +0000 (UTC)
Message-ID: <aa1a96b7141cdf88648de84a0e51896fba23d65c.camel@perches.com>
Subject: Re: [PATCH] Staging: rtl8192e: make sizeof type-independent
From: Joe Perches <joe@perches.com>
To: Felix Schlepper <f3sch.git@outlook.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Tue, 21 Jun 2022 08:25:57 -0700
In-Reply-To: <AM9P190MB1299D518C86D495B168954B2A5B39@AM9P190MB1299.EURP190.PROD.OUTLOOK.COM>
References: 
	<AM9P190MB1299D518C86D495B168954B2A5B39@AM9P190MB1299.EURP190.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: C136633
X-Spam-Status: No, score=-4.53
X-Stat-Signature: 3redqn4duodack9r4tfxoy1kjbsey4r3
X-Rspamd-Server: rspamout02
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/Gd2h38M+HMuAhZt6MzRncn/Cp1goTE90=
X-HE-Tag: 1655825158-138843

On Tue, 2022-06-21 at 16:58 +0200, Felix Schlepper wrote:
> Making sizeof operator type-independent.
>=20
> Reported by checkpatch:
>=20
> CHECK: Prefer kmalloc(sizeof(*txb)...) over
>         kmalloc(sizeof(struct rtllib_txb)...)
>=20
> ---
> Note: First patch, trying to follow kernelnewbies tutorial.

Congrats on the first patch, but know that checkpatch is a stupid
script and it doesn't necessarily offer the best advice.

A helper mechanism exists that should be preferred over checkpatch's
advice...

> diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl81=
92e/rtllib_tx.c
[]
> @@ -205,8 +205,7 @@ static struct rtllib_txb *rtllib_alloc_txb(int nr_fra=
gs, int txb_size,
>  	struct rtllib_txb *txb;
>  	int i;
> =20
> -	txb =3D kmalloc(sizeof(struct rtllib_txb) + (sizeof(u8 *) * nr_frags),
> -		      gfp_mask);
> +	txb =3D kmalloc(sizeof(*txb) + (sizeof(u8 *) * nr_frags), gfp_mask);

Use struct_size() instead, something like:

	txb =3D kmalloc(struct_size(txb, fragments, nr_frags), gfp_mask);

>  	if (!txb)
>  		return NULL;
> =20

though I would also suggest using kzalloc as safer against memory
initialization defects (and could remove a memset here).

Perhaps something like:
---
 drivers/staging/rtl8192e/rtllib_tx.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192=
e/rtllib_tx.c
index 37715afb0210d..bcccde91fa0bd 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -205,30 +205,28 @@ static struct rtllib_txb *rtllib_alloc_txb(int nr_fra=
gs, int txb_size,
 	struct rtllib_txb *txb;
 	int i;
=20
-	txb =3D kmalloc(sizeof(struct rtllib_txb) + (sizeof(u8 *) * nr_frags),
-		      gfp_mask);
+	txb =3D kzalloc(struct_size(txb, fragments, nr_frags), gfp_mask);
 	if (!txb)
 		return NULL;
=20
-	memset(txb, 0, sizeof(struct rtllib_txb));
 	txb->nr_frags =3D nr_frags;
 	txb->frag_size =3D cpu_to_le16(txb_size);
=20
 	for (i =3D 0; i < nr_frags; i++) {
 		txb->fragments[i] =3D dev_alloc_skb(txb_size);
-		if (unlikely(!txb->fragments[i])) {
-			i--;
-			break;
-		}
+		if (!txb->fragments[i])
+			goto err_free;
 		memset(txb->fragments[i]->cb, 0, sizeof(txb->fragments[i]->cb));
 	}
-	if (unlikely(i !=3D nr_frags)) {
-		while (i >=3D 0)
-			dev_kfree_skb_any(txb->fragments[i--]);
-		kfree(txb);
-		return NULL;
-	}
+
 	return txb;
+
+err_free:
+	while (i > 0)
+		dev_kfree_skb_any(txb->fragments[--i]);
+	kfree(txb);
+
+	return NULL;
 }
=20
 static int rtllib_classify(struct sk_buff *skb, u8 bIsAmsdu)

