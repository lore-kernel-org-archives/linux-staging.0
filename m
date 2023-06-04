Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D8E101CF
	for <linux-staging@lists.linux.dev>; Sun,  4 Jun 2023 16:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685895267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mEN+0TniimPe0eT5Q4F9MXhk6psY/lXJ+SgLAGSDQ9E=;
	b=c/Y9ndPjhymSDa9ko7QWxckugje6ZDkDvUTfD56tj/bjorFmvHD8VNOg/makrhTPc/RKfB
	BT43B3CPa57dkcxT9dvHP8Dajy7HkdHEPg4N/I4GtW4y/5L16uTpjdjSu24rm45ULVg6tb
	u4c0SBBeS84suzswQX45lchvcywr0Ig=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-GHbHWw-yOnyw4vpif4rexg-1; Sun, 04 Jun 2023 12:14:25 -0400
X-MC-Unique: GHbHWw-yOnyw4vpif4rexg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 228F3800159;
	Sun,  4 Jun 2023 16:14:25 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 914F0492B00;
	Sun,  4 Jun 2023 16:14:23 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 5/5] media: atomisp: Add testing instructions to TODO file
Date: Sun,  4 Jun 2023 18:14:06 +0200
Message-Id: <20230604161406.69369-6-hdegoede@redhat.com>
In-Reply-To: <20230604161406.69369-1-hdegoede@redhat.com>
References: <20230604161406.69369-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

Testing the atomisp can be a bit tricky. The BYT/CHT CPUs are not
very powerful so some apps like camorama cannot run at full FPS.

Add instructions for how to test with gstreamer which does
runs at full FPS without issues.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/TODO | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/staging/media/atomisp/TODO b/drivers/staging/media/atomisp/TODO
index b7a09eb20d0d..ecf8ba67b7af 100644
--- a/drivers/staging/media/atomisp/TODO
+++ b/drivers/staging/media/atomisp/TODO
@@ -78,3 +78,36 @@ TODO
   the firmware files
 
 * The atomisp code still has a lot of cruft which needs cleaning up
+
+
+Testing
+=======
+
+Since libcamera support is not available yet, the easiest way to test for
+now is using v4l2-ctl to select the input and gstreamer for streaming.
+
+To select the input run:
+
+v4l2-ctl -i <input>
+
+Where <input> is 0 (front cam) or 1 (back cam).
+
+The simplest gstreamer pipeline for testing running the sensor
+at its max resolution is:
+
+gst-launch-1.0 v4l2src ! videoconvert ! xvimagesink sync=false
+
+To select e.g 640x480 as resolution use:
+
+gst-launch-1.0 v4l2src ! video/x-raw,format=YV12,width=640,height=480 ! \
+               videoconvert ! xvimagesink sync=false
+
+And to show fps use:
+
+gst-launch-1.0 v4l2src ! video/x-raw,format=YV12,width=640,height=480 ! \
+               videoconvert ! fpsdisplaysink video-sink=xvimagesink sync=false
+
+Often the image will be over / under exposed. This can be fixed by using
+v4l2-ctl on the sensor subdev to tweak the exposure ctrl; or by using a GUI
+app for v4l2-controls which also supports subdev such as the Fedora patched
+gtk-v4l tool.
-- 
2.40.1

