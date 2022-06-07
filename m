Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net [178.33.251.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B367C
	for <linux-staging@lists.linux.dev>; Tue,  7 Jun 2022 19:08:14 +0000 (UTC)
Received: from player732.ha.ovh.net (unknown [10.110.208.22])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 8962B2422C
	for <linux-staging@lists.linux.dev>; Tue,  7 Jun 2022 19:01:08 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
	(Authenticated sender: steve@sk2.org)
	by player732.ha.ovh.net (Postfix) with ESMTPSA id 5C9AD1D75E8C8;
	Tue,  7 Jun 2022 19:01:02 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-101G00425171465-c27e-4da5-ab29-ec544616d68f,
                    38FB55E0ED6224772C245AF554E1AE62085133ED) smtp.auth=steve@sk2.org
X-OVh-ClientIp:82.65.25.201
From: Stephen Kitt <steve@sk2.org>
To: Jens Frederich <jfrederich@gmail.com>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	Stephen Kitt <steve@sk2.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: olpc_dcon: Use backlight helper
Date: Tue,  7 Jun 2022 21:00:49 +0200
Message-Id: <20220607190049.1132154-1-steve@sk2.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11561866145982154412
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgudefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeelgeetueejffejfeejvefhtddufeejgfetleegtddukeelieelvddvteduveejtdenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejfedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhsthgrghhinhhgsehlihhsthhsrdhlihhnuhigrdguvghvpdfovfetjfhoshhtpehmohehjeei

Instead of retrieving the backlight brightness in struct
backlight_properties manually, and then checking whether the backlight
should be on at all, use backlight_get_brightness() which does all
this and insulates this from future changes.

Signed-off-by: Stephen Kitt <steve@sk2.org>
Cc: Jens Frederich <jfrederich@gmail.com>
Cc: Jon Nettleton <jon.nettleton@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
---
 drivers/staging/olpc_dcon/olpc_dcon.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/olpc_dcon/olpc_dcon.c b/drivers/staging/olpc_dcon/olpc_dcon.c
index 7284cb4ac395..b9d570e9ad3b 100644
--- a/drivers/staging/olpc_dcon/olpc_dcon.c
+++ b/drivers/staging/olpc_dcon/olpc_dcon.c
@@ -517,10 +517,7 @@ static struct device_attribute dcon_device_files[] = {
 static int dcon_bl_update(struct backlight_device *dev)
 {
 	struct dcon_priv *dcon = bl_get_data(dev);
-	u8 level = dev->props.brightness & 0x0F;
-
-	if (dev->props.power != FB_BLANK_UNBLANK)
-		level = 0;
+	u8 level = backlight_get_brightness(dev) & 0x0F;
 
 	if (level != dcon->bl_val)
 		dcon_set_backlight(dcon, level);

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.30.2

