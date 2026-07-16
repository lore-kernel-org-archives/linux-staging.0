Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5156743F097;
	Thu, 16 Jul 2026 23:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784244391; cv=none; b=UNGyRANA7/In2Fcme2JSV+bmuIWk6f1XyIkerdF1Rp695EbzJYHqiCeawHZg3shiC9TgteYfaJJw936eD+p+g97X0dMjZzQt+sO55hj9Fx07g2ZhwonOyxVwUiLzPc+Ki3H4rjknGSle+fQyaoPAqh9pzc9s+9VKTMSv7gw3vs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784244391; c=relaxed/simple;
	bh=BVhjvZhGMiaLCa93vfj3ujq5Weyad55MoNHzoDNXoG0=;
	h=Subject:From:To:Message-Id:Date; b=aPxhIkNuM5wGK19aW5PEUA9HhyclKDs8m+S9yEuPlCQlyp7VWxsqckG+gvcSoLux+j/dKpxHd1aFnYC3RGoKZMHu9P9gmPLpyUJSVLaJl04JWvH0NP+yniifRltiRX98dR2H31N8hb9A7iH32KD3ig3oC/G9qyKcEWxIE6700yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=dsvb9vYj; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="dsvb9vYj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Date:Message-Id:Reply-to:To:From:Subject:Sender:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qaHa8KJLoBTZfeWC+MVLBqEjDwLjXw5lbB496sY+B64=; b=dsvb9vYj7tAQuKEQq01EVU+dsx
	yecGq94XdJ5UJGKVQ/rVzhBZhM6qJRIAIzCgbYW65BucU6bbZ21M4G9Pj4iP+S16Zy937vHDibZTp
	yha4VgK/Nw8Z+IPNNZXlCpmMvfMONS1ZD9om5aNElaBfogJDXFIiwEnq2FgdFmE7ac4CbSiZQYs77
	jXT9ltYUGW4Hm//jROn1uRC8qX2Zk5GH744+wcztAsOBW5V3w2ISRtTvo2lbhp9uWZqBnP/KtbZX+
	qUgOkdA3IYK/XDMN4pQYH/DjLWzXU+7YXHbUVwSVR1lxqDSZa7tC4nTALztBolVO58HLHHWBUQgK9
	9YSL8POA==;
Received: from mchehab by linuxtv.org with local (Exim 4.96)
	(envelope-from <mchehab@linuxtv.org>)
	id 1wkT7F-0006fi-2H;
	Thu, 16 Jul 2026 20:55:33 +0000
Subject: [media.git/next] MAINTAINERS: Camera sensor and Intel IPU driver changes
From: media-ci@linuxtv.org
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, David Heidelberg <david@ixit.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxtv-commits@linuxtv.org, Bingbu Cao <bingbu.cao@amd.com>, Dan Scally <dan.scally@ideasonboard.com>, Dave Hansen <dave.hansen@linux.intel.com>, Lixu Zhang <lixu.zhang@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-staging@lists.linux.dev
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1wkT7F-0006fi-2H@linuxtv.org>
Date: Thu, 16 Jul 2026 20:55:33 +0000
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

On Tue May 26 14:41:31 2026 -0700, Dave Hansen wrote:
> Tian Shu Qiu and Bingbu Cao are maintainers and reviewers of a bunch of
> media drivers (7 and 9 respectively). Bingbu's e-mail address has changed
> and Tian Shu's is bouncing.
> 
> Update Bingbu's e-mail address, remove Bingbu as a maintainer from Intel
> specific drivers and remove Tian Shu as maintainer. Also add Dave
> Stevenson as a maintainer and David Heidelberg as a reviewer for the
> imx355 driver.
> 
> Also add Bingbu and Tian Shu to CREDITS.
> 
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Yong Zhi <yong.zhi@intel.com>
> Cc: Dan Scally <dan.scally@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Lixu Zhang <lixu.zhang@intel.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-staging@lists.linux.dev
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Acked-by: David Heidelberg <david@ixit.cz>
> Reviewed-by: Bingbu Cao <bingbu.cao@amd.com>

Patch committed.

Thanks,
Sakari Ailus

 CREDITS     |  7 +++++++
 MAINTAINERS | 29 ++++++++++++-----------------
 2 files changed, 19 insertions(+), 17 deletions(-)

---

diff --git a/CREDITS b/CREDITS
index 84793a967a0b..7456c8bbffc2 100644
--- a/CREDITS
+++ b/CREDITS
@@ -640,6 +640,10 @@ S: 25-29 St Giles
 S: Oxford
 S: United Kingdom
 
+N: Bingbu Cao
+E: bingbu.cao@amd.com
+D: Ipu6, ipu7 and camera sensor drivers
+
 N: Luiz Fernando N. Capitulino
 E: lcapitulino@mandriva.com.br
 E: lcapitulino@gmail.com
@@ -3334,6 +3338,9 @@ E: rpurdie@rpsys.net
 D: Backlight subsystem maintainer
 S: United Kingdom
 
+N: Tian Shu Qiu
+D: Ipu6, ipu7 and camera sensor drivers
+
 N: Daniel Quinlan
 E: quinlan@pathname.com
 W: https://www.pathname.com/~quinlan/
diff --git a/MAINTAINERS b/MAINTAINERS
index b083e44ffce4..05b783f429e6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3946,7 +3946,7 @@ F:	Documentation/devicetree/bindings/leds/ams,as3668.yaml
 F:	drivers/leds/leds-as3668.c
 
 ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
-M:	Tianshu Qiu <tian.shu.qiu@intel.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -13135,9 +13135,7 @@ F:	drivers/iommu/intel/
 INTEL IPU3 CSI-2 CIO2 DRIVER
 M:	Yong Zhi <yong.zhi@intel.com>
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-M:	Bingbu Cao <bingbu.cao@intel.com>
 M:	Dan Scally <dan.scally@ideasonboard.com>
-R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -13146,8 +13144,6 @@ F:	drivers/media/pci/intel/ipu3/
 
 INTEL IPU3 CSI-2 IMGU DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
-R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/ipu3.rst
@@ -13157,8 +13153,6 @@ F:	drivers/staging/media/ipu3/
 
 INTEL IPU6 INPUT SYSTEM DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-M:	Bingbu Cao <bingbu.cao@intel.com>
-R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -13167,7 +13161,6 @@ F:	drivers/media/pci/intel/ipu6/
 
 INTEL IPU7 INPUT SYSTEM DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -13469,7 +13462,6 @@ F:	drivers/net/wireless/intel/iwlwifi/
 
 INTEL VISION SENSING CONTROLLER DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
 R:	Lixu Zhang <lixu.zhang@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -19902,7 +19894,8 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
 F:	drivers/media/i2c/os05b10.c
 
 OMNIVISION OV01A10 SENSOR DRIVER
-M:	Bingbu Cao <bingbu.cao@intel.com>
+M:	Bingbu Cao <bingbu.cao@amd.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -19995,9 +19988,8 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
 F:	drivers/media/i2c/ov2735.c
 
 OMNIVISION OV2740 SENSOR DRIVER
-M:	Tianshu Qiu <tian.shu.qiu@intel.com>
-R:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bingbu Cao <bingbu.cao@amd.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -20139,8 +20131,8 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,ov9650.txt
 F:	drivers/media/i2c/ov9650.c
 
 OMNIVISION OV9734 SENSOR DRIVER
-M:	Tianshu Qiu <tian.shu.qiu@intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bingbu Cao <bingbu.cao@amd.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -25217,7 +25209,8 @@ F:	Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
 F:	drivers/media/i2c/imx296.c
 
 SONY IMX319 SENSOR DRIVER
-M:	Bingbu Cao <bingbu.cao@intel.com>
+M:	Bingbu Cao <bingbu.cao@amd.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -25239,7 +25232,9 @@ F:	Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
 F:	drivers/media/i2c/imx335.c
 
 SONY IMX355 SENSOR DRIVER
-M:	Tianshu Qiu <tian.shu.qiu@intel.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
+R:	David Heidelberg <david@ixit.cz>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
