Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BF86AB6;
	Fri, 17 Mar 2023 14:17:59 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id h7so2821672ila.5;
        Fri, 17 Mar 2023 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679062679;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bLuzKAEkaqcIq6AVNq4PWYMR9r7yckQDIYx3W14fFbQ=;
        b=fLsYWDjuE07eQ6G7uOVyBOIkC4PhM2uiPK5xhuv90Xm/LclY/Ra0qzFnB8lU6UJS7P
         OXqIu97p4TXATvyYYNKHslRWDEScL1KR088FLjH2yVx3qaGpBKQN1rmU8tasyAMQRV8w
         OjpbjB+OctmWGzKRNWuPHTe/GhvMyVhQcDlILgN3ry4q4j6GMkK+2iQy7t9jjAsXhcwK
         /4sQD+m50YS9i/w6B//y5hNhOjObq93mxgT45VM2fGmbs/bCkATU9d2fokGy9zcYJNmX
         C5R62cV6FxRSnItqIPEepLiTCtmjD4slIQZBNXzqdLlPNzqCKPu7ZkCTItQP/g4+x6jx
         W7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679062679;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bLuzKAEkaqcIq6AVNq4PWYMR9r7yckQDIYx3W14fFbQ=;
        b=gxVvhqFtZcAcHH2hwiW96TnhgRPIToGKU8doqTkyFxHFCgUW38tk5RPH5IucadV7sS
         qTFmO3uVtnBlJqDkQsJ4h+Ui/gKBgN1Y6oZJuOeK5u0IqcG+9Ktep1gTexovn8QzyPHn
         hw6QmkfQLEOkxJoYp72+TurYq7QjZreuFmhykM3VcYtRsyKBDXrtNWIp9z7mEgyBzD7b
         SlZwSXNZuW4x9h1s2d2xOBTFDa59psosBNoBjbv2TsSFpVZEdf2wrM+9H/VTtl/hCetA
         NrP6xV+ibTZHXBEcQ2ZtenEuSy24EgKkloXCSIeVkxEC3Ila2PP6eznA+GXX1mAfxpax
         a/BA==
X-Gm-Message-State: AO0yUKUS0BKwYcnuM/SqLIIua6Lbg5Ta6vni04pjWp9W0MsoDpaLV9O6
	e5G9UdWa1zttcqGScl/zSyU=
X-Google-Smtp-Source: AK7set+OyC/Lyv3VlxfdCZWj7X/hYLmc594LVPMonaUxAi00/vpMqSiwJu5BZFZkgYI4SpckqUM1NA==
X-Received: by 2002:a92:ddca:0:b0:323:162a:80d4 with SMTP id d10-20020a92ddca000000b00323162a80d4mr5978ilr.4.1679062678808;
        Fri, 17 Mar 2023 07:17:58 -0700 (PDT)
Received: from pikachu-Z97-D3H ([76.76.64.93])
        by smtp.gmail.com with ESMTPSA id s20-20020a92c5d4000000b00315d1153ffcsm618638ilt.65.2023.03.17.07.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 07:17:58 -0700 (PDT)
Date: Fri, 17 Mar 2023 08:17:56 -0600
From: Mark Thomas Heim <questioneight@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH] staging: greybus: extract a fxn to improve clarity
Message-ID: <20230317141756.GA43753@pikachu-Z97-D3H>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The gb_audio_gb_get_topology function at the top of the file
needs to be split per a TODO comment above the function. It
is necessary to refactor the code to pull out a method
that has fewer parameters to improve readability. A
prototype for the new function is now in the relevant header,
and the simpler function calls replace the old ones.

Signed-off-by: Mark Thomas Heim <questioneight@gmail.com>
---
 drivers/staging/greybus/audio_codec.h |  2 ++
 drivers/staging/greybus/audio_gb.c    | 21 +++++++++++----------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index ce15e800e607..a2e8361952b8 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -177,6 +177,8 @@ int gbaudio_register_module(struct gbaudio_module_info *module);
 void gbaudio_unregister_module(struct gbaudio_module_info *module);
 
 /* protocol related */
+int fetch_gb_audio_data(struct gb_connection *connection, int type,
+			void *response, int response_size);
 int gb_audio_gb_get_topology(struct gb_connection *connection,
 			     struct gb_audio_topology **topology);
 int gb_audio_gb_get_control(struct gb_connection *connection,
diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..3c924d13f0e7 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,7 +8,13 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"
 
-/* TODO: Split into separate calls */
+int fetch_gb_audio_data(struct gb_connection *connection,
+			int type, void *response, int response_size)
+{
+	return gb_operation_sync(connection, type, NULL, 0,
+				 response, response_size);
+}
+
 int gb_audio_gb_get_topology(struct gb_connection *connection,
 			     struct gb_audio_topology **topology)
 {
@@ -17,28 +23,23 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
 	u16 size;
 	int ret;
 
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
-				NULL, 0, &size_resp, sizeof(size_resp));
+	ret = fetch_gb_audio_data(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
+				  &size_resp, sizeof(size_resp));
 	if (ret)
 		return ret;
-
 	size = le16_to_cpu(size_resp.size);
 	if (size < sizeof(*topo))
 		return -ENODATA;
-
 	topo = kzalloc(size, GFP_KERNEL);
 	if (!topo)
 		return -ENOMEM;
-
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
-				topo, size);
+	ret = fetch_gb_audio_data(connection, GB_AUDIO_TYPE_GET_TOPOLOGY,
+				  topo, size);
 	if (ret) {
 		kfree(topo);
 		return ret;
 	}
-
 	*topology = topo;
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
-- 
2.25.1

