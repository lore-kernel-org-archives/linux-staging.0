Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch [185.70.41.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACBB72
	for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 20:20:54 +0000 (UTC)
Received: from mail-03.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4FTbqy51Bpz4x85S
	for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 20:20:46 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
	dkim=pass (1024-bit key) header.d=amosgross.com header.i=@amosgross.com header.b="Q8DtPkvS"
Date: Mon, 26 Apr 2021 20:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amosgross.com;
	s=protonmail; t=1619468430;
	bh=vBBlbS/HZaT6XD4AyNrWjiWB8dQBJTxnGD5A9VwWb30=;
	h=Date:To:From:Cc:Reply-To:Subject:From;
	b=Q8DtPkvSnjoHBqusFLFcMGZNHo7YvaNKtUBPgGUxmpfJX1aebWHO58yZTaDxFEJ3j
	 7U1QoEwhyOtABzUG1RutDnlb9xR9XZDtOWLs6U42KWAsFJ6pXjBqOhSpsO/ZTRNm2L
	 OHZ/uYTNNSiDgbM8kRf0s2ZHIfFDIApCd9X07itQ=
To: gregkh@linuxfoundation.org
From: Amos Gross <email@amosgross.com>
Cc: linux-staging@lists.linux.dev
Reply-To: Amos Gross <email@amosgross.com>
Subject: [PATCH] Staging: rtl8188eu: rtw_ioctl_set.c: fixed indentation issue
Message-ID: <YIcgW0Av26N2Etxf@arch.localdomain>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

Fixed an issue for checkpatch, file was using spaces for
indentation. Switched out for tabs.

Signed-off-by: Amos Gross <email@amosgross.com>
---
 drivers/staging/rtl8188eu/core/rtw_ioctl_set.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c b/drivers/stagi=
ng/rtl8188eu/core/rtw_ioctl_set.c
index 17b999f45132..76dcaffea0fc 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
@@ -12,12 +12,12 @@
 #include <hal_intf.h>
=20
 static const struct {
-        int channel_plan;
-        char *name;
+=09int channel_plan;
+=09char *name;
 } channel_table[] =3D { { RT_CHANNEL_DOMAIN_FCC, "US" },
-        { RT_CHANNEL_DOMAIN_ETSI, "EU" },
-        { RT_CHANNEL_DOMAIN_MKK, "JP" },
-        { RT_CHANNEL_DOMAIN_CHINA, "CN"} };
+=09{ RT_CHANNEL_DOMAIN_ETSI, "EU" },
+=09{ RT_CHANNEL_DOMAIN_MKK, "JP" },
+=09{ RT_CHANNEL_DOMAIN_CHINA, "CN"} };
=20
 extern void indicate_wx_scan_complete_event(struct adapter *padapter);
=20
--=20
2.31.1


