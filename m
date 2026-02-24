Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D29336604E
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 08:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771922743; cv=none; b=EKJqe0cALNAMJueZBRPdpw5XC4cG48AXuCyxf0GdoG0oYC0cZVaF7lUHrfUacU8mE64XVjaBippRbaeQsEo89Z45o0Oe2FMAre7fzTHcbXeA1HGl/lbZO5pjbuYHUN9sHuIAcwqOfHEvHEZdDtto2JrKtYjWNKU+S+f8z12H8es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771922743; c=relaxed/simple;
	bh=6GJ7wwpufMKzOCs6Ll7VknfEXZk4guGu+jXTL5einPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pg53uc5Mzbe+rGRNK5fXqYLjRRUl3djPY7R/U3SVvKN/OaCPyNRz2/76vJ6/D9xmYtDcr68aZjt3wXr1qDFOZSJOnevn0nZDKpNy/hcF6nEAAvTWeqUuT6013K0gP1cNqbNRAB0T7JK84re0YHCiFnXVKXwb9UdXnD/RJzTAw0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DB2pCT3s; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DB2pCT3s"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4362507f0feso3236331f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 00:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771922740; x=1772527540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HGQyoPmmP4igIydqIgyIzKYxgE5L1j9Bpi6YK68BoI=;
        b=DB2pCT3svuhWsBi0OwBV3omV5njTO2So6A5N/eHXRCmXI4yU8S1ipxgvZu0dfxovQ+
         bS5fojKyRNmXHMYqUiuZTzIJgWO9s3Ov9tgIyZXJujP7slIvnw5/Qt0BpKp4KlHmQtte
         UbbDmXXbJOys5aeR7y5EEABPLVKksqWn6Jg+gMgwkjMFdLIH+KNHGXKy0Un6HQYncAIR
         kdKxk/niNubKYtakPDKLfMTp8zMbMUSgdTe0T4AgybVgXGt0SDFM8Og+Sua3xnMk326o
         QwazK4pFpYuwDVsCwHcYlpp0xwWUgFds/wm65KQCdfZ+9g15WZs9LaA/D4dFC4phAMol
         xiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771922740; x=1772527540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8HGQyoPmmP4igIydqIgyIzKYxgE5L1j9Bpi6YK68BoI=;
        b=DfRlvCIQ+o+rPzewLRA6B9ndeAJi+QuCsNGNdBVBKmvuu4BGmWLrojCpPSPr4Wu+VK
         ynmSUHRR6VQIXjs0lbvFhUp7dwmHq8fDuaqlpsTJQ1SmP3GjslFSRltD8018FvWmULrA
         G075XWlALSA7rvaiA407UMbHuPHAf93Sdcl+6TaW+TAleNGgomAt8+DdEoQzJeuspVz4
         EPecJnXv+jol9wp9AyzdlB35cUnWiRq+lRxARzGNi99Io3kXo8jHinRKSrvZiHNevqv0
         L7r60YfcXhrSzyo0kfDOOzr1CGc/4QQHc6hIJkALVN5ist5cvk50Y78Hv4yVipHzlhoA
         9ulg==
X-Forwarded-Encrypted: i=1; AJvYcCXFTgw2LsEQ9pxoPRYQxZGzL7dC64Zm5KRibRZcmIcKA0d+5yWPKvQ4JobLy8twWhxnw7ZERA5S1FS/srU3@lists.linux.dev
X-Gm-Message-State: AOJu0YzE7N2pkEw4gWCiJgOdWO/Fc+1KOvq7z/GW3z6Qv4tBcKFZiubz
	qTMYjg13tqQ7bevVpEeqraEmQdYC5ifXvxbWv16BocBW0SF4kyViWlirrXenpFlqX2fllA==
X-Gm-Gg: ATEYQzwP460E/ZpJ/eVb177ckQmiVvC1AqcfanxRsyl/DKURcw9mWmyn3L8HFQcxRtJ
	vsARhGB1GEbLjSHhmxfnP+ra5ZZz0XsO4jTN+gwc6DxZP6dpAmoW233rGfOFXVIT8AjANrh9dFU
	DWfGj9I6F+DMzDwkFJs6sJ9Dm2nCYkXTett62gIcOXMYYtfwO8Y1me5XgRkJV0Hi6iAYlImzGio
	ar4w0XyOohBXxAlax5yerJpF2R4lhsE/q5ONkClCFrrjOdxZnfM5ym8xP11EJy8ZI96WrG2/NEF
	g4qzX7T2L6GPFgg9Ivh7tY8NPqos18sX6Kl3cVzk6ur9XjTsUT777nf9aGpVER75KAOxtZ1byFz
	WDX+OpR0KkX4dbZKw2F54PMdUAccym06xio4fdvToA77UZPWWYJ5Lp7eiCtzAoM5XfIkVfcyZH9
	BJOdYTQ2dxsysHquLDseW1xFhGnpkn9RJ3XF2C9q4=
X-Received: by 2002:a05:6000:230c:b0:436:233c:c7bb with SMTP id ffacd0b85a97d-4396f194541mr20839944f8f.27.1771922739724;
        Tue, 24 Feb 2026 00:45:39 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c626sm27941713f8f.28.2026.02.24.00.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 00:45:38 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] staging: greybus: move topology allocation to codec probe
Date: Tue, 24 Feb 2026 09:44:23 +0100
Message-ID: <20260224084508.88867-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223195939.71151-1-azpijr@gmail.com>
References: <20260223195939.71151-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FIXME in gb_audio_probe noted that memory allocation for the
topology should happen within the codec driver rather than the
greybus helper.

Move the size-check and kzalloc from audio_gb.c to audio_module.c
and update the function signature of gb_audio_gb_get_topology to
accept the pointer. This clarifies ownership of the allocated memory.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202602240844.4eT24iVh-lkp@intel.com/
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
v2:
 - Fixed build error by updating function prototype in audio_codec.h.
 - Fixed 'struct gb_audio_topology has no member named size' by passing
   size as an explicit argument to gb_audio_gb_get_topology().
---
 drivers/staging/greybus/audio_codec.h  |  2 +-
 drivers/staging/greybus/audio_gb.c     | 33 +++-----------------------
 drivers/staging/greybus/audio_module.c | 27 +++++++++++++++++----
 3 files changed, 26 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index f3f7a7ec6be4..2d7c3f928b1d 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -179,7 +179,7 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module);

 /* protocol related */
 int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology);
+			     struct gb_audio_topology *topology, u16 size);
 int gb_audio_gb_get_control(struct gb_connection *connection,
 			    u8 control_id, u8 index,
 			    struct gb_audio_ctl_elem_value *value);
diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..8459a6d6f289 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,38 +8,11 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"

-/* TODO: Split into separate calls */
 int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology)
+			     struct gb_audio_topology *topology, u16 size)
 {
-	struct gb_audio_get_topology_size_response size_resp;
-	struct gb_audio_topology *topo;
-	u16 size;
-	int ret;
-
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
-				NULL, 0, &size_resp, sizeof(size_resp));
-	if (ret)
-		return ret;
-
-	size = le16_to_cpu(size_resp.size);
-	if (size < sizeof(*topo))
-		return -ENODATA;
-
-	topo = kzalloc(size, GFP_KERNEL);
-	if (!topo)
-		return -ENOMEM;
-
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
-				topo, size);
-	if (ret) {
-		kfree(topo);
-		return ret;
-	}
-
-	*topology = topo;
-
-	return 0;
+	return gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY,
+			NULL, 0, topology, size);
 }
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);

diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
index 12c376c477b3..84c591b59b4e 100644
--- a/drivers/staging/greybus/audio_module.c
+++ b/drivers/staging/greybus/audio_module.c
@@ -240,6 +240,8 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	struct gbaudio_data_connection *dai, *_dai;
 	int ret, i;
 	struct gb_audio_topology *topology;
+	struct gb_audio_get_topology_size_response size_resp;
+	u16 size;

 	/* There should be at least one Management and one Data cport */
 	if (bundle->num_cports < 2)
@@ -304,13 +306,28 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	}
 	gbmodule->dev_id = gbmodule->mgmt_connection->intf->interface_id;

-	/*
-	 * FIXME: malloc for topology happens via audio_gb driver
-	 * should be done within codec driver itself
-	 */
-	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, &topology);
+	ret = gb_operation_sync(gbmodule->mgmt_connection,
+				GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE, NULL, 0,
+			&size_resp, sizeof(size_resp));
+	if (ret)
+		goto disable_connection;
+
+	size = le16_to_cpu(size_resp.size);
+	if (size < sizeof(*topology)) {
+		ret = -ENODATA;
+		goto disable_connection;
+	}
+
+	topology = kzalloc(size, GFP_KERNEL);
+	if (!topology) {
+		ret = -ENOMEM;
+		goto disable_connection;
+	}
+
+	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology, size);
 	if (ret) {
 		dev_err(dev, "%d:Error while fetching topology\n", ret);
+		kfree(topology);
 		goto disable_connection;
 	}

--
2.53.0

