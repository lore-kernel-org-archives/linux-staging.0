Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7725C5661
	for <linux-staging@lists.linux.dev>; Thu, 20 Apr 2023 11:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1681988498; i=markus.elfring@web.de;
	bh=+ybhyLZv5baCEOkdQjp8oQ519JHGwcw65TaApNQ2jAw=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=KWHwHafKdS3aFLJLgdpaL2ThelY0rlcgk56USxInRLs1Qav7aLYJKgovFMjtCyR4r
	 TwAFalEqR3ay4sbcb6GQ/9B7csFDaPplRXGm5sEP+EKpn36XWVh+7piH2Ft8mDRGWr
	 iSStNs0tE95EaIPDg+MvbfeHbNs3VJFD/OduW1+mfJvx+LSPW4yWkyOGl1dJUYIr3g
	 A0ozkgTuPda/DT/TEvOk2mvM+2k8f3ahX4thXvzPveLWfrOsfw7ww/QFjujlaeunNK
	 9pcJOeIvOCbu+9McwuZc+adpNDcvzZCgoTURHfhIPxz4xRUs4toIATluByBBLSCyDL
	 Myh1tVrP4saDw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MnG2C-1qYixh3szU-00jR7c; Thu, 20
 Apr 2023 13:01:37 +0200
Message-ID: <42646e17-fa0b-73d6-df70-ffd69d2dd4fe@web.de>
Date: Thu, 20 Apr 2023 13:01:37 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 4/4] staging: rtl8712: Simplify the usage of an expression in
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
X-Provags-ID: V03:K1:TKY0VhyCIUoV6iNFH+BjASL5AWv4YpUngLEzB+BTVEQ55ugty0g
 3NM4mPQMxWyAY2jmxbfrDrAcSHGenrFf0AEBQt4y6+TXK+qv+vMh8BcLLmxLLGnGcaLixuP
 xJnMDIqljX8SzVnyNZDFprhcfvgFuQynWyIlZgM7DJQ0A6E7zh4Fmug8tVVfgoi03q6OB0Y
 LY6J/Ne76kL2fGL2xc74Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:w10+MYv+V74=;807EGHriM+5sHOF080NGx5UjkK4
 rC64Dq7F4decwe55lqs9FXHqDc1lW2HnJKuX+vfdY7n5fyz9X3IwMR2f2k2+oS/HEFAoIXDry
 JvhtzGbFFT4MCjNLHydhERNh3CMj9oZq8xJSUw+H9G4oIYWFhdKYZDVnglRr5KugdZAMWgFgW
 fvyV2y8jGVYE5VynEp9Tab2R5W1zmz2X9tjhyZZDqxFYbT9v8lP7+IDt52DUoMP5VrjJ/hbHP
 luh/KE5Jl0YBIGKIHYy4h5/qbb9s8Vuy2hHKgrh/aoW0vtGlyeL6dpKIqyn5GEe+0j4QAO+sT
 /wMYfwv93DEm0MSbTKCiPULZGcJdJJ1t4Ln37bPz9sXfneduMK5EHh2cF9YuKNq2c2tWhR0po
 2kzbD0iLgAJ06C8m8EkrNykA3oBO26PKLBk2wQkjjEzdmnuiBZ6+Wq7VmT5mPVd5ki0n6cCv3
 10GYQ7z0mdGTt6I/oI6yqZ84FMt/zioI9tfF7WeW12KkOHNJqPvYQXi+E2Xyoif8DZzRgzWwH
 Sgy73avZKsK0YgivvsO2mBZw1fTmudQrRFHxv4ABfqI36qHXVOfGAktgwpx0/Uav8U29lQ0Yo
 w0VfEsIbz49OxeFVtbknQCivtOI9MDMhcb3I/7taRRKDChbgDyy4THT1spyBPUnukUHJNEb+v
 XHWsEje2VrjKPaqC97Mw4DRmGcUMv7dp0gtIgtWZc+ETMVeuOFpUF4Fxgvj6oH8ZvpmZBwDu2
 9IrWEEYE4FqK6Fb6lanwcbHNn7KUYYNNJ+9Rg8rcC+XZ3AfyXdKSkwTrIolkvvH3ZuSLg2swI
 bdtIA8h/XAVvIVtv95ou+g3GkVghXRG/5KzXPyPEcql8uUVWyXpZNnCQ2gD/P5ch50u+ta4xc
 +JDdDCikiCWcJnvSViSPQd5o5GgcFbRENYFHyNHq7mm7/n7IhSZ5VB+H1

Date: Thu, 20 Apr 2023 11:44:01 +0200

An expression was used at three source code places.
Thus use its value by a corresponding variable.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/staging/rtl8712/rtl8712_recv.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_recv.c b/drivers/staging/rtl8=
712/rtl8712_recv.c
index 9135c92906ac..3d0c48918510 100644
=2D-- a/drivers/staging/rtl8712/rtl8712_recv.c
+++ b/drivers/staging/rtl8712/rtl8712_recv.c
@@ -862,10 +862,9 @@ static void query_rx_phy_status(struct _adapter *pada=
pter,
 static void process_link_qual(struct _adapter *padapter,
 			      union recv_frame *prframe)
 {
-	struct rx_pkt_attrib *pattrib;
+	u8 signal_qual =3D prframe->u.hdr.attrib.signal_qual;

-	pattrib =3D &prframe->u.hdr.attrib;
-	if (pattrib->signal_qual !=3D 0) {
+	if (signal_qual) {
 		struct smooth_rssi_data *sqd =3D &padapter->recvpriv.signal_qual_data;

 		/*
@@ -875,8 +874,10 @@ static void process_link_qual(struct _adapter *padapt=
er,
 			sqd->total_num =3D PHY_LINKQUALITY_SLID_WIN_MAX;
 			sqd->total_val -=3D sqd->elements[sqd->index];
 		}
-		sqd->total_val +=3D pattrib->signal_qual;
-		sqd->elements[sqd->index++] =3D pattrib->signal_qual;
+
+		sqd->total_val +=3D signal_qual;
+		sqd->elements[sqd->index++] =3D signal_qual;
+
 		if (sqd->index >=3D PHY_LINKQUALITY_SLID_WIN_MAX)
 			sqd->index =3D 0;

=2D-
2.40.0

