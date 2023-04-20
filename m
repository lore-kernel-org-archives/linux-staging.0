Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCEA5661
	for <linux-staging@lists.linux.dev>; Thu, 20 Apr 2023 10:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1681988158; i=markus.elfring@web.de;
	bh=4gvbu9uBE2LJtc7zzGzEmB1piY0xjV0di6DkC4cnuB8=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=RJ7hyD7jNZJMSGZE6XqTzxoGc494xPugUN2pgZME5m4N5iFnHeBbAOsSzXgUuUy1F
	 /fulv6FK+dnOZ3Ip6WvbNh/L9kXFfqyBVIvPBpNEfQixifMfAoXeojqjy8hFfEvYD6
	 Enpoz40iH6w17dxdlDxoCRa5ewo3pslXY6Rhr4N0aqgcrH4Z+iKaZG3gkZkvf/Y6rU
	 h1KEu2pAGrrMkcgPqoyF0P+5af1mOCRp5LT5WgXRPhviWD1k9C750EDvNXOISSfJVs
	 vy08Vp//PQ0LbPCO/wOU3ZaYoEIVh3JkzQ2zI8mCcg21AsDxAAB1kaeXhUNmt42bT5
	 M2/do+RAwnflg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MTOhc-1pk36o0bWO-00Tl8m; Thu, 20
 Apr 2023 12:55:58 +0200
Message-ID: <909c3901-c414-b600-388c-c4b06cde3847@web.de>
Date: Thu, 20 Apr 2023 12:55:57 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 1/4] staging: rtl8712: Delete null pointer checks in
 process_link_qual()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-staging@lists.linux.dev,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>, Nam Cao <namcaov@gmail.com>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <93913f0c-4699-cf9a-0f10-8edd478fd2b3@web.de>
In-Reply-To: <93913f0c-4699-cf9a-0f10-8edd478fd2b3@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:38DtJfAfoeuph+b/0A9v+OT0epFNQvTacrFXvf5nzl01pAG7qYX
 u3E+ecmXGvNDWss4dAoyQ7FGM7ZvKpTxwmxtdiUC3wufEXqd0h+31OpilTvSM+5Qg+SGIM+
 zU07HKm/7lzmpxAuXseeXfd1Jp/gKJV7UuoisxuoBYqwypRFOPQdHZQOPnQxOKsgMgMqY0o
 /mF93d4lvC0SGbyfAriEg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/42JqFFAoFo=;w5XSQJKinwf0/ug4YncKUZyEcxn
 KR8Xv2fJTeG0llQPApUrIvw/q5kBPsbsnJU3H8QEosTiQofkVciw9PN52w80IsKKxFCRQk6di
 7C//0rappcNnVi9I0vgRGEFiw72t1m4Y7OVfzGkbVI+tlhOqefx9qokKJa4QWa768m0fGP/IA
 O+LjVrfTp+NHS//yDyIbT2CJ7kFjsNJkebh8PIvh3FQAPchOyteHxzRy7Dap1Umsh+3r0iDQT
 2j26hv08GsueCs+sT90HEAQ2i5EfXDkeJyVMbDBJq9Iz50MIwOh3PyDhOq7/hlh6oOLxVtgk4
 C6RhxC3ULWWeSsugKY7EVkkbrFj33lWqijJo4xhu4sJONGQv2VpM61RrAntuB/LUT9UvGBlSs
 ZMfpAwqnfZeaww5h3P9HZMXbulhteZcq2+3u2fSAxBS5z3LRt84yDuC1p9AQKFLh1ltq0gDDP
 FVwcccDrcDoEE2yjQX7r9+QOxpMXs7B/buImemKVGDQmqZudS2BPEkjaOD13krdKtAngI4zs+
 U/KXzPxA293pC+a6+PplwPDWEN2BLiE0pvyk0iE1Z+SsGJDMc8QQHzY7h+d/1p1YZhZle7dY7
 VfpS7tjkh4RWeAv0YjVpf9Fj6bZkzTpPbGpzjbxqLLcYVoDmUezVd9cZszRZWTh7fvcuH0b/K
 Cc6X48HB1YMP14nUVi0JgUG52sILXSxrn56nTCFgVv/a5/P+HoEAEnkSz2AQCMefoEykPBLx4
 jWnSR7BpgCYvAxY5a4oj0XJ1w4vKd1TEtbydaJQlbRlRLjS1qPrdQ8xjbpXqFyGQ0ripmGq7q
 YGakUIBViAFXeUQa0NWffDV/sNe4UsO0sr4idqNujvH/yUMxbl9aYbJsfn4hlYTarp0RWzLHV
 v2nZnqiCullzBRBCejkBQ6mojQ0X5vKC9nlxgX3TWUyxNBgbvb1nKp6sC

Date: Thu, 20 Apr 2023 09:54:06 +0200

Omit extra null pointer checks for the input parameter validation
in the implementation of the function =E2=80=9Cprocess_link_qual=E2=80=9D =
because
it should be called only with valid pointers.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/staging/rtl8712/rtl8712_recv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_recv.c b/drivers/staging/rtl8=
712/rtl8712_recv.c
index 7da014ab0723..f0789b5ef59b 100644
=2D-- a/drivers/staging/rtl8712/rtl8712_recv.c
+++ b/drivers/staging/rtl8712/rtl8712_recv.c
@@ -866,8 +866,6 @@ static void process_link_qual(struct _adapter *padapte=
r,
 	struct rx_pkt_attrib *pattrib;
 	struct smooth_rssi_data *sqd =3D &padapter->recvpriv.signal_qual_data;

-	if (!prframe || !padapter)
-		return;
 	pattrib =3D &prframe->u.hdr.attrib;
 	if (pattrib->signal_qual !=3D 0) {
 		/*
=2D-
2.40.0

