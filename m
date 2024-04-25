Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACC714D449
	for <linux-staging@lists.linux.dev>; Thu, 25 Apr 2024 16:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714064368; cv=none; b=jQWjriVRObDcI+oJnlo6rKAie4P4C0Bwarb+varBaVr8wDKGH1t2xTNHVp9foVywIG7LvrCvtSDZY8QTk3Npu+NZzRVcwtFj9RVhOj3F1Pv++GmcRHK3WGnBmtfZanTg4uxfPnXAvL/dYWYq/UTmRPWuNMe82UxvkjJVDKHoQfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714064368; c=relaxed/simple;
	bh=WwWKP9xrbj81iysN3ZXfNkx9SCV8aKKaWrj8AazeR7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y79J5P2gLxoF0zZLQhKUGc3GRuWCf03sozOroAEn63kAg/AIWQM2D/PfmKId7baVsV1vW6AvyxGbLQDNuNeDpHIXnX11NI8Q0nHamAGcVg0dinsIda7CP+uf8SeHjthoJTuYZ6o6oQnGjCF9y6ZFIRfBm+M6r6bVTjTZJArSkuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=IC/BsgY9; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="IC/BsgY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1714064354; x=1714669154; i=wahrenst@gmx.net;
	bh=h7WL1l3kzh5o9Rl4X2yF/GPxgKaU9BKPZn/MU+snOYU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IC/BsgY9KWEsdM5qNz7NE1GeJ3uSMJluicQJFzKQd9n4434yEJBA+P6ZNJWh4Evn
	 awrJyjS1uKyfyQqBgHnKjmD8UsOVonIUtkqVDsvAJkcD6EHSvDL+hG3n4nlYpB6la
	 S2i4iWn8Iqy8SIErt+RpJnzk+lPwmAfsTPuFAX2aEHCqWREetJQdX9ywsPrj16o/U
	 TQ9L2UnrKdMakSAUcWJMe/2ETNs2mbsUgfn6si0SzKwkiZFcbjw/X0+rNcpC34J1T
	 JANr+nXrdkI9xj8Y0SbHp0UnYRFJCKZiRa3V2TtS8m1i3D8Y1KHeAcpJgUxqGzMES
	 zKNiPovNf4K7lSA5TQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3se2-1si04g21nE-011YR4; Thu, 25
 Apr 2024 18:59:14 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH V2 1/5] staging: vchiq_arm: Drop unnecessary NULL check
Date: Thu, 25 Apr 2024 18:58:48 +0200
Message-Id: <20240425165852.6681-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425165852.6681-1-wahrenst@gmx.net>
References: <20240425165852.6681-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KiUUZ5NMFofHqLqChs85AYuddbYy1L3UO5tmdxsBl6/R+c+Pz8i
 lsZ+8MbLWCvshmxhtfneJh/36wpDWezhAj3Epb1nk6FJHRz4zw6Dnsg/BLDXMnJ2chNG7nH
 N9ZNliiu9hOmY0AG/ekl72gs6bA+oLzHQ8GEH1QJm1bEEjymc4CWPcK8ASmQhILeqArhAi7
 xfYAJtvFW6WEdzgp+kV8Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Kf2NzxddZa8=;83rBTtOAcEo5uJKhI4e3Zose7kn
 tR+0Wh4T9/Da4F6CdboeuSwKdoLAO1jz3UWaVG3v4OW9K21+yVOzWXTsjNd613bv10Jt1S5cm
 J6z8U8C7JUMK40aepxAmt2cvEwTv+d/EAbW0cfRWxpiMVQ/UodY0qftrNHZjgca0QaxXBWcTJ
 v1eTe96Ehpr8h8XXc4LDQ/0GUvgX1ZWUDiExqPGpYGMaRuCcc79Xb0k3WNo29qYQxaw/Wh9v6
 mNHf3qjsmuAw/hd98XHg+kInIf46BumAIkMhAEty4XeV0qGlWnO8SGPCLIDt/cRypYZ0/30ke
 jMVShTJsgZj/J/oGdg0j51NFm5S5OzBqg+lwlVhC5eRGmjnZppdYVufAZP9hdfg4nr+WRKprV
 qRQG+w2z5iS/dr7coYwoWoWOfE4Cp/ARTjVB2LX+pGZyyg0vMQA33vaEzzhVGzlYu8NYMHuDN
 +72rCWfxgfd1jLyVgexPFMO7Vw0NWCUlEu1GfRWyL5HxVNQw65b9Ji5XukU2nqZFjlHJwIc+K
 Bhk7A45XQdYJMMbvW8U6e0aMOmlmp9zHGGt5+u7g9CwSZYnmAfbwockWfUO/t2hnpMu5BJ9sz
 fU9BN4ykgV2cYA4plANJFLREev26L5nKUVOMQvadHiw/vy6d2FBxakcbEbiy6y3SrCQguwf6U
 B0lW+MwCB/1mpfE8EXTcwLU2+D86XUkOSk8O+JbciLraR69ysJQdVfU5Bg6kHx0E3Brh5B9G5
 KqWF5jLB/jKlUOncDaMAp36fY+sXEU8pvCf8tbtHKNCPNNgkAS+KXK5cXCjbslTZf7BiWWn68
 JRR+cEdFZsDOdnXmXpOlULSyCNodXw0dmow+jnN9uGDBg=

Looking at the handling of service instance within the VCHIQ
driver shows that it's not possible that service_callback is
called with instance is a NULL pointer. So drop the unnecessary
NULL check and fix:

vchiq_arm.c:1109 service_callback() warn:
  variable dereferenced before check 'instance' (see line 1091)

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/linux-arm-kernel/202404230315.vx7ESZ3r-lkp=
@intel.com/
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index c06232fcb0fb..297af1d80b12 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1106,7 +1106,7 @@ service_callback(struct vchiq_instance *instance, en=
um vchiq_reason reason,

 	user_service =3D (struct user_service *)service->base.userdata;

-	if (!instance || instance->closing) {
+	if (instance->closing) {
 		rcu_read_unlock();
 		return 0;
 	}
=2D-
2.34.1

