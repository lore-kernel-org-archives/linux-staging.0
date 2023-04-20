Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F27723A3
	for <linux-staging@lists.linux.dev>; Thu, 20 Apr 2023 14:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1682001011; i=markus.elfring@web.de;
	bh=z+KZpoWWvEdh9etFvznA8aLGjPNzyCvihafs7DqVEuM=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=lrFcH/F7SzsPJ5ttiiwEc7yaJSf52EgjDpd19P+eZU3/u6sEBU2sbuKKgQyuiwdmh
	 LGhZ0RmrnFpm6RnKNsh0dJGK2qktb3TEz174tyAOxkHOP9pnaFE9Ecx5dZGqKPvBeY
	 Ldxig+Lbq29zdq3MAKks1FyrnyD23Dg6Zmm3anWkKgMfz6vTCSvR6qeaxIaQt7/KHa
	 Pj6oZn6AhQhBfRPIyTGEK+cWWMVweRYpi5dkXE7kT9cKRaLkUcyUfvqbBHC+lkjBQj
	 LxlFFIDsISTec8P9PyuC/oX+j7gIYmBAK+qlnADdEd1ZPATxQu2ZOShjScbHFvZ8+W
	 fnqAm3CvZBMjA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MuVKI-1q7iwD1yWQ-00riDe; Thu, 20
 Apr 2023 16:30:11 +0200
Message-ID: <f362cd27-21dd-fff5-729d-213c4d326457@web.de>
Date: Thu, 20 Apr 2023 16:30:10 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 2/4] staging: rtl8723bs: Return directly after a failed
 initialisation check in rtw_set_802_11_bssid_list_scan()
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
X-Provags-ID: V03:K1:RaeZfTF0Y04sKU9uJMt6erzFJ/CKFECD9TvSuylZMsN9aG8fmeO
 cLq9bkfMU2ImMJ1ON7HGrwFJLqPU5BvJhFZHO1esUKlnH55rJI2888mwFJmzjOPCx6JiwVw
 JlwnhJQun0Xkha6CPB9+/2bdlB8ltCmwECrjmicHxEainhxrxr0qfU1yZoCAnlQ4Lq/AwsY
 409RI+7BYAKJd6eEocfhA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3rors8jRyW8=;M+dkLfGFLZj0tsWBnFI0BszFzMp
 1ww27KO5Ubigq6eWt/xfUt7C4pb8JfnGTOsBzblfC50fvAU+h1pYt1o3OS1pP+FvtuKU/awwW
 c9wSlH9Qlqa0oo/VRKe5GWxu7HdP9f6yXKVHINJRhB0t6ileei9dgAnBgzVbYR6y3eBorgOhV
 f/cldxJqwEFkWHtB2NZYcc+jgEyL0oE2n+FMY6nq9/t3vPUZY7+26fwm/2Nwn4lORdD5p2nbp
 RLxN0yKhlGhsyAkDwPievTkdYCcEktOyEVQpGwk7s59wbMtu6KGIkzxZNmU2EmfM20JecwtUd
 npu3VAHPkoABhbZfDtldebuoch6EAUm8wPAX9uKQFTZhVrO1hXvkVSOckCjbnwj1jpLWdZIJu
 4KxQNFTw4xejKGajXPAppkANXrbBwAmbr3p08y7vrOt/1fXKUTECYTyDSixtBbQ9CMhCPN+i3
 g76T7yPuqrOYi+MzDPx0GhzKq8CeofqT7CVF3x+rkDFl1hH1jqp2yPGkhg4e4ZU2GEstNKGa8
 E3K/mYqalwJj37QFZodgFUu1GVJOvlmZENjd76hUjBx18833FkaJtNSX2yC4UVpuqjiH8UfHZ
 6ZW4o2tb7sASH3tl/juJJNGzFz+U2a/nlLbqJgmbiLH3Az8awLoonrDwclvYsHWAjderVuXXg
 +0D+tj3GKD82l63hwxGNES4D+aW1Vzk3mTxIHfRqmQ32SEy/uX3fo0sBjdnw2GKYhZjZzTkjz
 Ixs5nj//4uu4ej91Gq621cr31o9m42SpJ0SfI6JbAjnSicAD6AOjkyL8n9W6hxw0mzKi0A/qr
 j0EQFIYh2GMeQRzSR9Apmu/WaoBrKdhvVWvt0BQev4dgS2BWpfjs3ersm6KYUKpjegg8ymliC
 A678qoHvJ0LbeKSH3cocmc8e30NELWnKhvk1PZhXhgNH0qd/6C2pMkZpr

Date: Thu, 20 Apr 2023 15:46:37 +0200

1. Return directly if the hardware initialisation was not completed so far=
.

2. Delete the label =E2=80=9Cexit=E2=80=9D which became unnecessary with t=
his refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/stag=
ing/rtl8723bs/core/rtw_ioctl_set.c
index 7c902f50d38b..0c2df854afe7 100644
=2D-- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -371,10 +371,8 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *pad=
apter, struct ndis_802_11_s
 	struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;
 	u8 res =3D true;

-	if (padapter->hw_init_completed =3D=3D false) {
-		res =3D false;
-		goto exit;
-	}
+	if (!padapter->hw_init_completed)
+		return false;

 	if ((check_fwstate(pmlmepriv, _FW_UNDER_SURVEY|_FW_UNDER_LINKING) =3D=3D=
 true) ||
 		(pmlmepriv->LinkDetectInfo.bBusyTraffic =3D=3D true)) {
@@ -391,8 +389,6 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *pada=
pter, struct ndis_802_11_s

 		spin_unlock_bh(&pmlmepriv->lock);
 	}
-exit:
-
 	return res;
 }

=2D-
2.40.0

