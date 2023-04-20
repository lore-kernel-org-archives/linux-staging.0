Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CC123A3
	for <linux-staging@lists.linux.dev>; Thu, 20 Apr 2023 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1682001127; i=markus.elfring@web.de;
	bh=qo+bG1q0U33/ld0dMM3MRlRvSbwgrbkLHvDLzo4qX10=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=G9JEsqdX068ZHqDiZsy8mJ/kvHHeEETJeRRzqF7gVQj0mtbSjUDgmjN3lAZS7t9y3
	 Ecmu4sK91jhjVgMpj0P3wz4EkFeiYBuRxtfcs5PWCB5PoOJ2Gf4e9FU+sc6Eadcd9S
	 J/cBjJE25C/rgA0PYOCZ6VM28suq4KnkYym6dtCvEIs2V+rmF8M5nUv3zOVhXNjJGG
	 qaJLmfEVPZHvnNLhy1BnzFeyE77ZSd/vheE22CL5U7w3ynbleQhtQaoOERzdiJLUFd
	 5c0aPvOadEKt8vjZsSWlokSNk6fnYqiXuX3y9eQ/+9++r6wclpWT7hSJgPeokCqaqF
	 MuVJksGu5HyvA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MqqTV-1qboda1OUL-00mUTO; Thu, 20
 Apr 2023 16:32:07 +0200
Message-ID: <03e39afd-f588-6201-cce0-46faef9deb8d@web.de>
Date: Thu, 20 Apr 2023 16:32:06 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 3/4] staging: rtl8723bs: Delete an unnecessary variable
 initialisation in rtw_set_802_11_bssid_list_scan()
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
X-Provags-ID: V03:K1:kA/0AaqPUba7hec/pzDaLlzetU05R6/6ygc/N4ehh1n1BrOkWZF
 PutBrf26Ve7hoPi219s/otplM9WWQ3YG+7OlQswgR56SJBKgw8YK/0LMZrRu5alzhmJusZ4
 oPR36ar+j8SzhgruyFc343820ZRGiv+XLVXg6EAAlF2utmyRdaqTGhnaGWNuigDLEPyWav4
 M5waOz/OOMjWdyPf7MlIA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:764KsoPQonU=;/4cCV5wxJKNMPSa5oxBuBGhpCI+
 gXqDIK5WFJaAPyVQeGbwaRmK4IH56I15VzshvIf2arAKQRd/e8xvyYYrGE09ti1atoE0AxCy0
 wApUiDlnVEalfaHZSPMiZ6TaK/+iWgyCsUhafC6/fNfw/MCsRRSC5uYXAYrD3+WBtWsqVmA6F
 1YfpIwn3HCmMCRKOFggQrD5+N4l3LDB0CJaDXZLPWlbusuElHs2wmWxOq3qcpXM/4HJ56L+cp
 TAOvCdyF2KI3x6J4Kfln4Yf4bAe9Ip8e/QILqEif1/yNJXJW4Am0saJg/4T1rIvkNFO94KL8n
 bSwETEdHNEMVGuvW0aNnWSr1ARvZ0SJ5pNTrn3oUAdK4iwCBlE20k+YFfuUbZKWa1NzKeVMEE
 +FfeDF9AjINCMYq+xr2XRbIejB3EOiEuiVuQfkIhbfFKQPSGK3xC8/rjdEX4rgGfnJGX9BRDR
 j7+UIAg9DVjKb5JacLxd6kahl3Thi7zdDL3SJfT5/7z0NqMjUzl8y5lLyrvgmFdNmwi/g0CG8
 BUuilJitZF3rjQ+lLGI1VHnRrVAoNBlgbsbVCQqK8qnLt0d2F6XyIqBHGp6LZAFwG+tNMNX+2
 OvO7ygNRJB9sgmZfz7Md1dfQ8ByMwt68W08UvKxAF0EYKJ9mBBnq90STtgnpQqDNTqyKaZm8n
 UL4CoAXYQC1euy/+2uTemO08ItkvApDuiriVhN5ekAzwmDxCW4XY9PfNXpQlKh0tbPiR8IeBk
 gLMA3nKTjUTVKiF19TRJWwJo5tPoVJnEuaDuSmDerVenLoBY/LZ7D4jmXmsJjXNXfQ7oA8ZIH
 qQAF4R7kfdd+mpLNMxWMFWYPo0uzjt/vx5Yyllwljql6kcqSW6xL4ed3/SPLTZTCtzBmQpzcf
 HoUieHPsLX4/jyr4ZYl4O8vnU/3Y/5ecok9Y5z9gECvWh4GtIPcmyC1NW

Date: Thu, 20 Apr 2023 15:55:48 +0200

The variable =E2=80=9Cres=E2=80=9D will eventually be set to an appropriat=
e value
a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/stag=
ing/rtl8723bs/core/rtw_ioctl_set.c
index 0c2df854afe7..0716b704106d 100644
=2D-- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -369,7 +369,7 @@ u8 rtw_set_802_11_disassociate(struct adapter *padapte=
r)
 u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_8=
02_11_ssid *pssid, int ssid_max_num)
 {
 	struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;
-	u8 res =3D true;
+	u8 res;

 	if (!padapter->hw_init_completed)
 		return false;
=2D-
2.40.0

