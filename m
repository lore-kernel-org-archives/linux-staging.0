Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEFB12CD91
	for <linux-staging@lists.linux.dev>; Mon,  3 Jun 2024 13:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717420871; cv=none; b=JON1VZZHwr7Vi3jZRb3Vvvhk9FTnUipjEFGuZ6qqv85hfMITEEeoG6KDAskGoPNoR8f+BXJOkDr4IYmCKqIfXSLfR9tdqWfVFIyeSMaPmcVOyTqNwnctYlbbrMYYhz8e8jiTAlJvexBEwM1VJ5HovFtd22ZbQgkhaDjSPSsvbac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717420871; c=relaxed/simple;
	bh=vW/DrzcA2QaVC+nVsqekgkqJdKqV/8/tn9VGlbhxtfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kW6hgxy5fGkZ3v2hCYOa+hWV1NSW7w27SndUnXt8mZtto01NhLbc9q2p3VvGqfsD5sglXWJeOHNX4TkAJ23NWnarmIuMIQSj5bcdThRIhAuKEVFFpAw5+0zyoCOyGxeiukb4y790ykHypyflYTwefFxBizQ5p7yaIvU0CHDZyPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KI8JYL3O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KI8JYL3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717420869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjM1+CX6ixdtpG/JpZd7uV7NuQ2/9yw1tY17ILpmXKE=;
	b=KI8JYL3OIL1enmLdyxaojZ6pqO8r06wDMD/0TVUJLd+mkI9vpoPKkUJog+Ra2phIY7Y1Xe
	3Vw827rcSHCq4PyF5cuwss5U4OuFTiQ2yMEzlie09mGm7tLEv6YKkVu6n+YJpBm3Qibk9E
	Wxq2kZiDb9a2YIit0gT3fyHmEZ+6HTY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-Z8vMpfmdN2ep5jd_2_43Yg-1; Mon,
 03 Jun 2024 09:21:05 -0400
X-MC-Unique: Z8vMpfmdN2ep5jd_2_43Yg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 182081C05131;
	Mon,  3 Jun 2024 13:21:05 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.39])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 931761552;
	Mon,  3 Jun 2024 13:21:03 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 4/5] media: atomisp: Update TODO
Date: Mon,  3 Jun 2024 15:20:56 +0200
Message-ID: <20240603132057.255917-4-hdegoede@redhat.com>
In-Reply-To: <20240603132057.255917-1-hdegoede@redhat.com>
References: <20240603132057.255917-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

Update the TODO list:
- Remove comment about adding firmware to linux-firmware this has been done
- Add a comment about removing unnecessary / unwanted module parameters

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/TODO | 31 ++----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/media/atomisp/TODO b/drivers/staging/media/atomisp/TODO
index bfef99997a1d..27cbbde93b1e 100644
--- a/drivers/staging/media/atomisp/TODO
+++ b/drivers/staging/media/atomisp/TODO
@@ -1,29 +1,3 @@
-Required firmware
-=================
-
-The atomisp driver requires the following firmware:
-
-- for BYT: /lib/firmware/shisp_2400b0_v21.bin
-
-  With a version of "irci_stable_candrpv_0415_20150423_1753" to check
-  the version run: "strings shisp_2400b0_v21.bin | head -n1", sha256sum:
-
-  3847b95fb9f1f8352c595ba7394d55b33176751372baae17f89aa483ec02a21b  shisp_2400b0_v21.bin
-
-  The shisp_2400b0_v21.bin file with this version can be found on
-  the Android factory images of various X86 Android tablets such as
-  e.g. the Chuwi Hi8 Pro.
-
-- for CHT: /lib/firmware/shisp_2401a0_v21.bin
-
-  With a version of "irci_stable_candrpv_0415_20150521_0458", sha256sum:
-
-  e89359f4e4934c410c83d525e283f34c5fcce9cb5caa75ad8a32d66d3842d95c  shisp_2401a0_v21.bin
-
-  This can be found here:
-  https://github.com/intel-aero/meta-intel-aero-base/blob/master/recipes-kernel/linux/linux-yocto/shisp_2401a0_v21.bin
-
-
 TODO
 ====
 
@@ -35,6 +9,8 @@ TODO
 
 * Remove custom sysfs files created by atomisp_drvfs.c
 
+* Remove unnecessary/unwanted module parameters
+
 * Remove abuse of priv field in various v4l2 userspace API structs
 
 * Without a 3A library the capture behaviour is not very good. To take a good
@@ -61,9 +37,6 @@ TODO
 
 * Fix not all v4l2 apps working, e.g. cheese does not work
 
-* Get manufacturer's authorization to redistribute the binaries for
-  the firmware files
-
 * The atomisp code still has a lot of cruft which needs cleaning up
 
 
-- 
2.45.1

