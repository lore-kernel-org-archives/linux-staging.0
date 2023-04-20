Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA82B8C06
	for <linux-staging@lists.linux.dev>; Thu, 20 Apr 2023 14:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1682001262; i=markus.elfring@web.de;
	bh=uAeIY80p5MhUuLcqefnnFblRiL2V9PhZBf8nL2GOy+g=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=bXO4YOi5cGQ3vNuSM9l4llV9N81CabYe1YziQfd2pa1/0C1inOES5KHp9M/lTkYt2
	 vVrLCa0DxCPLZCL04BToZoDuQKlb1qVwDVgHuEmQM0d1gOqw/WuD1JB3JG8hGJTWAe
	 X770mN3k2sr8Cy2nqb515oH1IWgWfHJqxFtJjsxu1exlMFtekMWgkLom0qPDOnLriQ
	 1HND9KVhbpyvO5eldE/N7xYlfP6BEfpEAk9I9UIQqwLxamdNXrRLi15fhAOlTcOGz9
	 A0FGxlwOCKNfQqkcizOh+tsggp6etAKTXhYKagPsQFrATQBKiImdNtpFsUcO8X6XHM
	 q868b6t8vCB6A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N79RI-1qNi661JBE-017g3b; Thu, 20
 Apr 2023 16:34:22 +0200
Message-ID: <e988a5e2-31d7-051e-b818-58f9f40f26a8@web.de>
Date: Thu, 20 Apr 2023 16:34:21 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 4/4] staging: rtl8723bs: Move a variable assignment behind a
 condition check in rtw_set_802_11_bssid_list_scan()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-staging@lists.linux.dev,
 Emily Peri <eperi1024@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <1f72786d-7ef2-80fa-58d2-98e379dd8ad7@web.de>
In-Reply-To: <1f72786d-7ef2-80fa-58d2-98e379dd8ad7@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:APVPZD2CDY++TX90TXRFW+9fXJfnlZm6neOTRsveKteYrwTnm80
 SDBSETchc0vSyrS4wUcwBhFAUCuCDgnDm6glwFQXgXBM+ZZF7HNXdiT0X5mt+mtg4EbvNe6
 dYKZrk1RD1BucC7wKVWQYKblVthFyT/TKpcBHPMA8djTVD3jXGALnjF3cF24QQE/o88Xs1+
 CcQKEb/QGMhEyuuQpZ8lg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wVbcBAyKbuQ=;puXYyQXaxICD0sCOx1srurG149Z
 yPzQvDDvoBKxWwAHrMvZLkDZDn5o7NvccYXGg5oD0V9/WzNgslhRau+bo5qsKSFJglATSvivs
 Vst/lXnl1ibMmUtmSDU7GPnkFcvl6JMRRj0sm8hoNfDItLnm8qmsJ2PaMbjm1lF53TsPyfNiZ
 8/8lr3Y6PAjuA655SPEJU0SWwaD6E4SnHf084GNr79eJWs0MhUy/YPvVJ8SBsQ5uUI029QczI
 KzaQbkjDQUYsVqAx5agfLmN2ZcfD6gvEyogS9nRT0S4ccLZ6gkmalLewTdq7FruZpM70uakbu
 /s+WyN4M4SVlV+5FRilJ2IqxvO2pnJ18jPzmxNY+Oji5LLPiG/QVVsYRR6fyPeqsi1wYMM3jO
 HsLz87lXdcsVfQN1Eed8fvt7+WhwOsUugzOVMGQ/SRj5bywP/AGc27uY09GsBHZjDzEJ+woCU
 OVnoupMV4nykgjcTWY6t0Ty9gXDktjvJRSm3XyrZNzF6Uu8HqpHHKlbAjK6GugF09FLxcpUk7
 wyrerDBg3VQysjtcXw+FR/ArulNzflYksU3rJj5sn1plBoS4OVuR37zAjHUWbDakS85ApkF4t
 Q5JMn2v2UzpiynmwKWw5y7EzBlaWUbdFc1iMM17/ftbfN89TZsLjeJPX29geUUopR4+Y3DyWY
 0GNc0mWIObDMRSY2mKX9uGVpUpn9X3rDTZclAJ18tAkGdQiNoU0clrB3PZi/7ut7pCYOSYEln
 Ih3pBk104xwg1W9484nl7Nrlt8PYuHHL7tbYho6FeVcfJC6bDOIpKMmyq3v/vG9//1DSLSvg7
 RMgZLYekFSwlSlaXYyQu8Q0+J5l8uwEtwi0Nys8SuhhKwtgbWqScflE+aiyYfvmwG9OBPWpzz
 I3iiHGFhB1ouU6yfk1Q0Y29q4Tvk/Z2viHAU+YrJe/VRvfhnXun/nUhG0

Date: Thu, 20 Apr 2023 16:06:08 +0200

Convert the explicit initialisation of the local variable =E2=80=9Cpmlmepr=
iv=E2=80=9D
at the beginning to an assignment statement directly before
the source code place where this pointer is used.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/stag=
ing/rtl8723bs/core/rtw_ioctl_set.c
index 0716b704106d..fc6875b4697e 100644
=2D-- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -368,12 +368,13 @@ u8 rtw_set_802_11_disassociate(struct adapter *padap=
ter)

 u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_8=
02_11_ssid *pssid, int ssid_max_num)
 {
-	struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;
+	struct mlme_priv *pmlmepriv;
 	u8 res;

 	if (!padapter->hw_init_completed)
 		return false;

+	pmlmepriv =3D &padapter->mlmepriv;
 	if ((check_fwstate(pmlmepriv, _FW_UNDER_SURVEY|_FW_UNDER_LINKING) =3D=3D=
 true) ||
 		(pmlmepriv->LinkDetectInfo.bBusyTraffic =3D=3D true)) {
 		/*  Scan or linking is in progress, do nothing. */
=2D-
2.40.0

