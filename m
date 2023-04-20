Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B420B5661
	for <linux-staging@lists.linux.dev>; Thu, 20 Apr 2023 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1681988418; i=markus.elfring@web.de;
	bh=yVNz0zRUFaBIjw6ncsDIy6LUCEBNHWGuhGpsmQOM59U=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=MvCAyKPvCb3XTbAxs7PXPRWsed7ZKZAzxAzgnQI0QlBEt3LU2N7HszzGXTe5dgnip
	 HGDvAwlUs73DIBTzH4Mi5WxvyXPc6azLEwTjPMcShOz3C7YpravtNl37Wsk/iKYTBx
	 48gRoSopMDFvZq04JcGQxRPqUVVIVwj2Uvbik1cG+5fTDIecGJ9kDMuwyvrGI28HVa
	 xEI1I3u5EQsvxnhV+rulYvO3GQXXo4Mb2r9x8tafXoBpgC4kaGpJVwTMWu1L5JyLPv
	 NjxO6E4Rng0h4uJoV4PEchKGs6cNpNpKjF0FXKQ+bN5mxY3pQCuZNpyMXwZSa6DlnN
	 YhRoNjSLDK9jw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mvbms-1q8uNo1Xss-00sosX; Thu, 20
 Apr 2023 13:00:18 +0200
Message-ID: <3930048b-ea3c-6053-5500-151e87ca390e@web.de>
Date: Thu, 20 Apr 2023 13:00:17 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: =?UTF-8?Q?=5bPATCH_3/4=5d_staging=3a_rtl8712=3a_Reduce_scope_for_th?=
 =?UTF-8?B?ZSB2YXJpYWJsZSDigJxzcWTigJ0gaW4gcHJvY2Vzc19saW5rX3F1YWwoKQ==?=
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
X-Provags-ID: V03:K1:ix1NfPSREvnT10t0sLjbzWq70+AYtZ0oonh/2D2GafAbOoGBapa
 j0xQKt5z9dm+5bqR7VUqAiWS2bnW+xsucCFeisORtV/+R/LXna6waUYEZ5Bolnvg1aqNY/V
 kj6KU6n1XjhbdXap0haPuPmzz7yNwCGIBaHcSfSOCD6TV5Nnkcz53g1U6uhzaBbQFcFBdMp
 2EBVtLVLmFhGpnp2L2KzQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:P3kV3W0LZwI=;Tq+ZhVhLYW1cPXWNM0UzWEW4wxu
 Exvjlha+DKOSsPfkpzSJ+0s+J/MavbHGog4H7/86ebi9udgg9X+ecRAEYIEMhYxgBX0N379E1
 mJhNSWikP7XkbHKGxsFscXE9ZNHsm4nIgDEa5cdkAW8Bqd8KzjyxWIIvyROAsIOP1UOUB74+g
 3ygWdUP5LIt+E0soRYJm13mZHw5PLKr6r4NK2+MP2FU1WSERNQ0Tf+7bwOsmyjeRFE5X2ypqY
 MXlDg/TwC7G0lHkv1z7pNvIZqqJdsaooa9bd6nCNYnqg1Z2ezDbx2/fAx8Uz/BArJTucUGH1S
 /ikUt/ONrttcZ1Fs8moBia7FiLp8X2VR4cqvUpmHYsb5ambYEAdGSmbflQU7flMd2zy3x0YE1
 9yhAyU61am1eXt1kQxTPEHDR1HmCsW5pBFolZlCTqKUaQkJnQvIVna8pGYa1Xhq/KZXYnrE06
 CUvRP3oESepEqJb/ndePWw2PQMgyTu12nJEvR2JwWOui7X5MaWvO9QvTBgc8icra3qMiQ79Mq
 QRYbZVHwbMZFtJwUZ9kw9KMq3toCIlcwzDJjb6iHy3+qrrtDS62Kfk8+GApdnbnh68u7mm+V7
 HrlbdKy8Zpxs0kwVhjJw/gl3HInEUE8gfbT+P5oGd+sjm5X/ACjYBGdmw6l7g/z4uTE17Px1e
 0mWMOdxpCK3czvgdWeMer3ENRAtNaJim3o4RqHtd2W6bG1K2UcSZJHuwp+9qvwSjRHCRgTDLJ
 kKtmzR8jpBT1I4qnM1jyZoaqZ2Fmqi2giGmKjonS5pZadZ2NvJkY5dC+P/dXDUPMid1m71gnM
 AoHXUf0Q/C6Jja/KaG/OX3hjnY6ZWA3BP3bUE9vFtha/wpSklgNpsOUUe24j3wFmGHlieFao7
 YqYzBbWgfGxv83VZyk2j7Rkg/W4OrFYOQYgFTLy4zWcRyxOQ3H8KwUcB1

Date: Thu, 20 Apr 2023 11:00:11 +0200

A local variable was used only within an if branch.
Thus move the definition for the variable =E2=80=9Csqd=E2=80=9D into
the corresponding code block.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/staging/rtl8712/rtl8712_recv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl8712_recv.c b/drivers/staging/rtl8=
712/rtl8712_recv.c
index 3a72d0601dc0..9135c92906ac 100644
=2D-- a/drivers/staging/rtl8712/rtl8712_recv.c
+++ b/drivers/staging/rtl8712/rtl8712_recv.c
@@ -863,10 +863,11 @@ static void process_link_qual(struct _adapter *padap=
ter,
 			      union recv_frame *prframe)
 {
 	struct rx_pkt_attrib *pattrib;
-	struct smooth_rssi_data *sqd =3D &padapter->recvpriv.signal_qual_data;

 	pattrib =3D &prframe->u.hdr.attrib;
 	if (pattrib->signal_qual !=3D 0) {
+		struct smooth_rssi_data *sqd =3D &padapter->recvpriv.signal_qual_data;
+
 		/*
 		 * 1. Record the general EVM to the sliding window.
 		 */
=2D-
2.40.0

