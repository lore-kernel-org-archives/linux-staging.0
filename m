Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECCF72
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 19:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=dbaedf251592; t=1632597943;
	bh=k8iRB1HYotJ4xRYC5qXhCzYv80mMTq4bl+ffCv2R8VE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=gu+D5DDk//saVGjyfkkwHMhsO++jYd+yS01SXFXA5AkBoNhTDs+LoY8luMo1TKAHn
	 Y4we6DaRVt96cn/6iSq51Uuc7PmGdmyeezSnR4jisWlV60BTn1mp6P2e0C9W4DBdOG
	 QFDwbLcH4LcGZXnMHFFJ02sK1eMZJz2/6fzmm/HQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from michael-LIFEBOOK-E751.fritz.box ([94.134.116.230]) by
 smtp.web.de (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1M1rP8-1mS1MQ3Ej2-002hLf; Sat, 25 Sep 2021 21:20:26 +0200
From: Michael Estner <michaelestner@web.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: michaelestner@web.de,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Remove uneccessary parantheas
Date: Sat, 25 Sep 2021 21:20:15 +0200
Message-Id: <20210925192018.6745-1-michaelestner@web.de>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vG3rfyHjdsA70oWYuIu0rZ6gKYxwFE9HXxaNP6AKJS9e4l5/FJ1
 /4LOaUhg927l0ZSjj0Uv5qE7ri01yQbf5rgwOAcZxU4RXUFr7PVzBzCXy6krGl544uJXB3Q
 Vsaij6O0aOPSsgkP7hZM74IcQ2x9d49K8NLOMaI0lbb0rtGiM+y+8g9af1iUU3cELSyWdRD
 aZOl+3w/ms/7DCdB8sJlg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oGikA8QyGGA=:y1qWwXNaVtrCiaOe1GQCVW
 hAmhV0nAiuzUeZ81BGAa6am9caE9pj7faSZOvHPUg04Ocwunux7+ExJ4NaCABqCVxKV41mgWE
 P/U/j6mXUzPEr+s7Oo77B1iAAGjcBgAuSXLXMLmW4wM24r8SsDLQWjClSJHX/1Zot31nxjPp1
 nt9Dgy17sOYtYEhlN/ngX+ER7RY26djloirIXWJ3Gcx5MEWiPZJpkhDUKPgODHrdCUf8U8iEZ
 cigRvpM20E7aeouDnd8GDmzRDO+96a4ER0WOKVRNuEfVSgDPUpGSOs4U4QQmV0TIz2YtZR/v9
 qzezISm02GY0y2Bgk9PujCAMhYqOUJEaNjyGMv5PJGERcQvNUoFTvsz4qiVKuSHcp0LHI2/Rd
 whcekDK4+26qbxYkr8PeQ47fSWUT8u0axDZCxNx3go0kJgV7r/z7ESqzt6jO7tYrNocjndqaH
 Mj+S+0dMnfGScVdZhSpT6pMlIbZCbH8RWKMUxsYuHNYKTCD8K978OiR4XDTrXm0PXNyrKtkR2
 FJ0spXL3Yzf0h6QLan64ziSadkRWodSTa9mm6qKxqo0Pk3lwNVvuu/l5QQ4CmGVfJZVNUPgHZ
 Wec7K749tkMKduel2YasVeOs9OK+osRABOT2NJ9WGKhQ3RgKJHT9cMxPI8BWqqF74uHgUr2jF
 CtrSSTjaa+gCoPHJKturDknhM21rYTzVGnQucleyFDl8uxlYlvVZj/l1Rr8gE1rLJbhXG/aFK
 FlTIXegMS0JdKlno33emdNNdVpPXmydrv8dbnS+x607ELgVQS7vzKuSrXWgBqzMZm82/clOmr
 TuT07VgGD2jUrfHQZmC4bG/uE6ngVwl94LvyZpgVIXOeZk7vuQjbWQ9aS5d5UymyDdN0OddNh
 Q0r5Ek/fOomQXDt4y/shbEfKX/X0d1Mkp2JtRY7hiSswEbx0I4VUIEBHcd0t5tZntcMPXyUSz
 mMEtSj16Pw/gzlQ7vltUYUUgaj6pCX1tNCBG2CW3isHfo9g8kn7cAgbQ7HEwj4va/9PnIx77O
 mJa4tzvYSoYI4+sXm7l5wHHa1YBuZdzUUTQN+43NEt7fr8NX+LtS3cu9OvcC9LJB4WL386OKi
 XTyCx7+poJJXXk=

Fix to be conform with the checkpatch style requirements

Signed-off-by: Michael Estner <michaelestner@web.de>
=2D--
 drivers/staging/pi433/rf69.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 7d86bb8be245..980afa801e08 100644
=2D-- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -470,9 +470,9 @@ static int rf69_set_bandwidth_intern(struct spi_device=
 *spi, u8 reg,
 		return -EINVAL;
 	}

-	if ((mantisse !=3D mantisse16) &&
-	    (mantisse !=3D mantisse20) &&
-	    (mantisse !=3D mantisse24)) {
+	if (mantisse !=3D mantisse16 &&
+	    mantisse !=3D mantisse20 &&
+	    mantisse !=3D mantisse24) {
 		dev_dbg(&spi->dev, "set: illegal input param");
 		return -EINVAL;
 	}
=2D-
2.25.1

