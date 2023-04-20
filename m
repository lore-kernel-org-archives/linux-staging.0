Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11FA8BE9
	for <linux-staging@lists.linux.dev>; Thu, 20 Apr 2023 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1682000896; i=markus.elfring@web.de;
	bh=Nat07+foseHEeoLG9kBdXBlDYseS8WWy52TkkvH8H9U=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=abZE+M5Rv6X21W4KUWrzzpFlcVouRg2bEb6ie1HeX3YM6vwtjHI+09F9+SMHFj+SN
	 xWaHvJGb3SZ09s4J8CwUm/X46B3YcE5ae0eC8EXolcO+o8PbAU6jH6238x3gKYTyAq
	 G0zXhVrfvGMGKy385djk+zUwJSR003yZyqqwHWJWmFxc36h/sKml830fdN39QHQdUC
	 Yr14XYPkA0SRRq4qg4jAkO73aTbcKJkrvYYCzKPmODomcxpwtTRy/nivzzru4bFUd6
	 rORWDA3Y81jWEGAjpswYNTLihMxcsmtirRy5gZ2xsUEs51TCbL5concAG/Z25Su9wc
	 9Wo+C3mlZEwyQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MXGOI-1povfl3f3u-00ZAnB; Thu, 20
 Apr 2023 16:28:15 +0200
Message-ID: <159910bf-dae8-5f09-3ef3-86d522916cf1@web.de>
Date: Thu, 20 Apr 2023 16:28:15 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 1/4] staging: rtl8723bs: Delete a null pointer check in
 rtw_set_802_11_bssid_list_scan()
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
X-Provags-ID: V03:K1:Wj7aghoTytYPnSy+nlg/fF7y1m9gHzyF+wU0Qhm6MVdORGtjwCs
 gtaJqoWyvjMkafRDBE6YI/Pl2sA8OxXY/xAi8meqRoAHR+S4fTyjMHospzCnkO18ggpq37Q
 44U1NWnXK9bCijxTH4iRA8o5dPJ84qnIoG4BAwVP2xhm1TquS/dl1hngAolvniNjYt8sjjL
 nNLBANsAG+XKcsEsj23rg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BQdCSr4Gt8Y=;BsE6HNWqEtgPYuDCaVASs3z7nqS
 KWK9j8KmJl7BlKjp5aXgVMZn2EO8AtfWrJp5cJFMoqXOS2WcSFv7OWc2UicXMuLbxgL7MEYGD
 RzgMjbvAgm5vX6dEl68D7vGAY+tjGxNdXfsUYploZGYMm/8kOvUThgVAWXXiOMiHw8AD+yIwd
 H7Q0dXdzzgWFrfERFilDy+LR+5mNXhuhC8hyiIFctgJpyKWX597hoO94fMNtQhHWafqtOEiyY
 Ipn954ze36WjfK2qvPqiXcMq96V2RB/p4WKUKTVJYc06nqbV/Edae8M5uESFDYVEZhYHEkSRp
 oo7kmGO1ZvVtvwtBFz7mTTzWF1XOnU9xhA0ifeMCJIbuUxxTuyUq/TYopYtuNJIZyqBbkqazV
 VtvwDCm/z0q8cwTeGnnU/SbWbYVe/SORxix/DT+Ih2Y6qMCcSrRdKkN6XnRnanhDEl8LgS1I1
 BON8ukgXWsFYNdooRjkopDH7/2ZbukDnsp4oohOQfdD7u0KwE2Lmul+z1WCrxZQ7DplZwpcWY
 t6NVLka9IVRLmZWm8fXSAM+VR6QNtwxjSrs89HDb31d3a4OeCqm9egR7+QRfR5zs6CRku7R81
 u1rdgMDLrs2RWnxxqCod7yJVqMxkVEEROL6gV0HZLTi4SYpOgdEIRg0fUJWkakb48H9Ou27jE
 tEGkNyNNHzm/yJqQttWDKJEMAlzr1LCSZNKAM/B02R+xY+3q/EH8y1GcW6plq7S9vl4simV4I
 /IkrUFl/0bzdNbXCKBadyBgsyoYxZtlgxhDMSX32UNw+xB2Z4NkII91A2ryy6hS96kuH0/Ino
 uGbr59AGlbg9EZySdJ0AaJM5Gh7ulGh2bHD6PjiozaB9i3ety+BAnf/nzXgQZiE5J/z+gq3dW
 KwvgZJ2iz4NVMytlx8fbE0wSYWNoNaFm4PXAi3fDnwwd+jejrgFD7N8hj

Date: Thu, 20 Apr 2023 15:30:23 +0200

Omit an extra null pointer check for the input parameter =E2=80=9Cpadapter=
=E2=80=9D
in the implementation of the function =E2=80=9Crtw_set_802_11_bssid_list_s=
can=E2=80=9D
because it should be called only with a valid pointer.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/stag=
ing/rtl8723bs/core/rtw_ioctl_set.c
index 3b44f0dd5b0a..7c902f50d38b 100644
=2D-- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -371,10 +371,6 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *pad=
apter, struct ndis_802_11_s
 	struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;
 	u8 res =3D true;

-	if (!padapter) {
-		res =3D false;
-		goto exit;
-	}
 	if (padapter->hw_init_completed =3D=3D false) {
 		res =3D false;
 		goto exit;
=2D-
2.40.0

