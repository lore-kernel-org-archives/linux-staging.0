Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A199653BF
	for <linux-staging@lists.linux.dev>; Thu, 20 Apr 2023 10:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1681988236; i=markus.elfring@web.de;
	bh=SZE0cUCDOOXWg8zRxrGD0Q4HTIB4ikPnukA8nJ2WvJw=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=nQmmMWw6kXtgLnkt2T/mEMl046gd/PNc+Fy+EOMDpg8jmKQlbHXD05fFXj6AsM+4Y
	 rYgEpKn1uEawwtxE4xJBYuuCRhY4Q6tqNku4Ci9+BcvodfL7vdKyIkp53/uzjJGseG
	 BUIqt42HfMVz6ud0zGFCM8YZQEGiGzdwUvUQvQyq8c8QwittbNmvnZS2oB++LpxM/q
	 90xzfXbVyzDpEEC9OiD1PlA17a8uf/MxVjZYrhaPVwjCBotKIMohJN+HXWVPLTjSyV
	 PeB7+J1JtvABrVMazlQZx+XbokKyNFVfm7UEBoVuo+mt3sctMGk1jfqEIvt9c1M/Tw
	 ZDx18zuC/wAaQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Md6xz-1qP3hw3fWt-00aFmh; Thu, 20
 Apr 2023 12:57:15 +0200
Message-ID: <ce12ea4b-236b-d04f-a804-6afdbd38aa4a@web.de>
Date: Thu, 20 Apr 2023 12:57:15 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 2/4] staging: rtl8712: Delete two variables in
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
X-Provags-ID: V03:K1:oYEnXOgTbBYG+N+9oPcwOtYEbImxYiNKTRdLmJXL7Fi7Vb96n68
 gcz1GA/bpP89NLPWyqUzIU0wdMMQ1qTPiuoETdSg4WqHafTtHnYL7H0dAsZgPKPmNEa8rHt
 933pzwi/uaPOmEuK+Stm9Ff/mgJPsj1hygoqdkIT9umRKXCgnBYiE79EGXpH4BxSpc/1gd2
 uwMde8KGc+GaSHBvkyb/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:g7reQkIlh1I=;qKvl7wWpwxIcjcBGfTsv+zv8odN
 7/P+L1Z0VLztrj60F7X/fCV2w64J3Yh4m7lBorm+PfOL3mi4oU0NY3/RpHohLNxVQG1Wsb2SC
 3+2XWznzWV1kzBc6g2dYE7IPGDsxH/i/OzzM+XCZ25wBBI8PEX6m4QKX7HsODUfvU2Iy3JTUp
 tdfo196oSMbBx6dTYpaQ89ZPfMXZUvzJK5TSYOkqCyWHbJhj/vROqfJbeZ6TuH9Dk4DpXlDj6
 uTudaqmSorVp2Jby0dZWNL2XlJbYwhkDn5MoiIKSrq+07Uy2MyweqYHkQ/eLX18x/Mj3a5642
 OA5kpJvxHz7HxT2qXRqmeLSOidYA/w60VKjSrfAjWeonfbSFO+Q2UlTaF4N1VmWGoDLOM+3nu
 AcTF++4EE2OwyPRb19E43yEzheqbdkq1dX68zac0ce7M6jjtRAuP9Wcy3nvi1voSZQJx/0kUG
 wCJcuwGxgomAx3BDZq7KT5mSNoAQxxPCcPfyUl32ZRTaoqIYClU4ImLm0KZ5WzRdOhFH6NTrD
 DDh5gdNHhOBD7VeTdg+P1nOkkjvLKVrWdUzEOwVPlBO0byIye81rAvyr03dXhrqeEYPtfm8rU
 CI8bDI7DH8oYlrZfhuxAT6RPtCv78Ng5m8/fB0AygAjd9MSTKoFtt/FaE95kzuhy/G5FW/LiK
 s5+C05q3aUa5TX49SjeQK0iG3LfkOBhy36KYms+bxcyKycMEqBquD5Tq1U4gI/9ImP+Y991ra
 yT/nEEpOGi/f0crXQ7DMXAxOD8eYh1Kvf7ytEvKKiDi7NRbsMhlvwFVTpgHmxTmTB73XjNNyg
 OoAKbRo5hGWysrFXj/qKv2fidbBV7XsD2Ob2ehX5KPj4U3ucMi+sK4EIN3DOBl8jhG968nZTu
 exgJtM5iMcPdt4Bm35sYNW3zVx3hdIX3MrcX2GGf4Nr5woMpA/VFrQjTr

Date: Thu, 20 Apr 2023 10:42:40 +0200

* Use two values for computations (in one if branch)
  without storing them in intermediate variables.

* Remove the local variables =E2=80=9Clast_evm=E2=80=9D and =E2=80=9CtmpVa=
l=E2=80=9D
  which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/staging/rtl8712/rtl8712_recv.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_recv.c b/drivers/staging/rtl8=
712/rtl8712_recv.c
index f0789b5ef59b..3a72d0601dc0 100644
=2D-- a/drivers/staging/rtl8712/rtl8712_recv.c
+++ b/drivers/staging/rtl8712/rtl8712_recv.c
@@ -862,7 +862,6 @@ static void query_rx_phy_status(struct _adapter *padap=
ter,
 static void process_link_qual(struct _adapter *padapter,
 			      union recv_frame *prframe)
 {
-	u32	last_evm =3D 0, tmpVal;
 	struct rx_pkt_attrib *pattrib;
 	struct smooth_rssi_data *sqd =3D &padapter->recvpriv.signal_qual_data;

@@ -873,8 +872,7 @@ static void process_link_qual(struct _adapter *padapte=
r,
 		 */
 		if (sqd->total_num++ >=3D PHY_LINKQUALITY_SLID_WIN_MAX) {
 			sqd->total_num =3D PHY_LINKQUALITY_SLID_WIN_MAX;
-			last_evm =3D sqd->elements[sqd->index];
-			sqd->total_val -=3D last_evm;
+			sqd->total_val -=3D sqd->elements[sqd->index];
 		}
 		sqd->total_val +=3D pattrib->signal_qual;
 		sqd->elements[sqd->index++] =3D pattrib->signal_qual;
@@ -882,8 +880,8 @@ static void process_link_qual(struct _adapter *padapte=
r,
 			sqd->index =3D 0;

 		/* <1> Showed on UI for user, in percentage. */
-		tmpVal =3D sqd->total_val / sqd->total_num;
-		padapter->recvpriv.signal =3D (u8)tmpVal;
+		padapter->recvpriv.signal =3D (u8)(sqd->total_val
+						/ sqd->total_num);
 	}
 }

=2D-
2.40.0

