Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0733613DBA4
	for <linux-staging@lists.linux.dev>; Thu, 15 Feb 2024 22:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708037635; cv=none; b=S8foL3JYNYgDM+NvcsrJLRLsfcFJWj/+8i+Tu3NtOhWzVN2JrP8nL+WPZjsu9hYzmcUU8IbZZE3tOOpjucsqH9DmGZnztH6z10lw9/ezKfeoPZwhEFSj1Z+jVy6w1Y+aW0ON1SkQYI1CiS5Ngbu/ESDXg7/ynyOkwNuLPZ8xz64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708037635; c=relaxed/simple;
	bh=XnFYaR+j8cXDRfdSASbIWHQxzHD5XY3BItp+mlM97jE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SBc3t4vxoHeCm1DK5k+p1gS+Gpcr+eyfTm9CxAQ/cdGT8hGHCbQRbFNMvU+Ap6IyELV4MzlVRsOk5XjesUAenGtFPqYBRay+gbqqod5G50pTuSsiedZLLpiifFsg8s/qo+dSx/wmMXiy68BGLQfJZtM+/KTJon6d1ZRHryg3gfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkA5PVXZ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkA5PVXZ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-563a6656c46so2142929a12.1
        for <linux-staging@lists.linux.dev>; Thu, 15 Feb 2024 14:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708037632; x=1708642432; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B8uMPEt1VqqPCM4teLHLJiETOk2ZEgqVh3I3k6LiZj8=;
        b=fkA5PVXZG1OvDXag8QxpAqNN4p3U3XWTssISjMNDjq8Q3nK/SDCiHxQhCmT0tPheiT
         adKDICXy4PPwsHbv0N4zL/O6vl/Ii8sm0Yf+u+g8YuRmGu5NsHv0OaS00volxq6gtsQ8
         OEqh3HW1UJbc0STFqc6dHMJNWJVgAjEvHNsv5P4EdrOjsxXvZbcV8LsmMEAnpRCaDvjK
         KWr1JpLyKGwZmD2eYCgjjRTetm8rvOuFBcWyccXvP7axs10guN8GClARs9pjDUy6dB3S
         +/uWEMSG791DFDztR916sXINMRrLfovp1pgMm88SuoUU0iJgUWUQ8r881Rd6oUXK8yF3
         B3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708037632; x=1708642432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8uMPEt1VqqPCM4teLHLJiETOk2ZEgqVh3I3k6LiZj8=;
        b=QNVOfu59HcJekIaYJGbX0iSQdGlZcK9Xw0664IoYVVB2TGzpEtEWT1j1uK3m8ZS1te
         8nGZcjptD8oMIM7618OR1ZokvUO4wzo7n4p4UDIhdxKswhw7lvhLV8nHRGA4VIeDhSfL
         UrHeMB8nFNKhjBI4hYPRwGjsZZ/FNUtEYraS5WibPurDT0qvCEmWMrPhCi5v6MGjPXBQ
         Yp0C3cdqYNNwnfk8tu5x5f36E2vttnb2RzP7rw0ZDbSfMcE6b3YrH7AxhLNwGFHU/jM5
         A381cHTsYSNIvUtT3ekgK6hwlOvo+7XA8HSdJ6kIKPvNOWG77RTsSnjcpmOz3BOhJR6l
         OpZg==
X-Gm-Message-State: AOJu0YxYhqm7AkOY+zNqfI0ZqgiJLSiI8pTpbZrtcI60sggQrSTPjX1Q
	XZfcj1QhKjwqx4rcCedmYFBeN0/pyAMZ+wvxEgTAAqhOEsr4kEmP
X-Google-Smtp-Source: AGHT+IFlo2ZFjZKkscUV0bL+SgznBaVctw2W1+GyDMpwF9cTad8lPj/HYGbYR4mHHuMLUSHvASiJHw==
X-Received: by 2002:aa7:c149:0:b0:563:d042:4bdf with SMTP id r9-20020aa7c149000000b00563d0424bdfmr1041581edp.0.1708037631968;
        Thu, 15 Feb 2024 14:53:51 -0800 (PST)
Received: from pinguine.lan (ip-176-198-146-182.um43.pools.vodafone-ip.de. [176.198.146.182])
        by smtp.gmail.com with ESMTPSA id p3-20020a05640243c300b00563c22abac2sm650782edc.61.2024.02.15.14.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:53:51 -0800 (PST)
From: "Moritz C. Weber" <mo.c.weber@gmail.com>
To: florian.fainelli@broadcom.com
Cc: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Moritz C. Weber" <mo.c.weber@gmail.com>
Subject: [PATCH 3/3] Staging: vc04_services: interface: vchiq_arm: fixed several brace coding style checks/warnings
Date: Thu, 15 Feb 2024 23:53:28 +0100
Message-Id: <20240215225328.11141-1-mo.c.weber@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed code style checks raised by checkpatch

Signed-off-by: Moritz C. Weber <mo.c.weber@gmail.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 6 +++---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c        | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 1579bd4e5..c59bea191 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -432,9 +432,9 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 				head_bytes = actual;
 
 			memcpy_to_page(pages[0],
-				pagelist->offset,
-				fragments,
-				head_bytes);
+				       pagelist->offset,
+				       fragments,
+				       head_bytes);
 		}
 		if ((actual >= 0) && (head_bytes < actual) &&
 		    (tail_bytes != 0))
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 76c277781..5213f7c55 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -230,6 +230,7 @@ struct vchiq_service *handle_to_service(struct vchiq_instance *instance, unsigne
 
 	return rcu_dereference(instance->state->services[idx]);
 }
+
 struct vchiq_service *
 find_service_by_handle(struct vchiq_instance *instance, unsigned int handle)
 {
@@ -1192,7 +1193,6 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 	header->size = size;
 	header->msgid = msgid;
 
-
 	svc_fourcc = service ? service->base.fourcc
 			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
@@ -1618,7 +1618,6 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		break;
 	}
 
-
 	svc_fourcc = service ? service->base.fourcc
 			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
@@ -1842,8 +1841,8 @@ parse_rx_slots(struct vchiq_state *state)
 			int rx_index;
 
 			WARN_ON(state->rx_pos & VCHIQ_SLOT_MASK);
-			rx_index = remote->slot_queue[
-				SLOT_QUEUE_INDEX_FROM_POS_MASKED(state->rx_pos)];
+			rx_index =
+				remote->slot_queue[SLOT_QUEUE_INDEX_FROM_POS_MASKED(state->rx_pos)];
 			state->rx_data = (char *)SLOT_DATA_FROM_INDEX(state,
 				rx_index);
 			state->rx_info = SLOT_INFO_FROM_INDEX(state, rx_index);
@@ -2177,6 +2176,7 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero, s
 
 	for (i = 0; i < VCHIQ_MAX_SERVICES; i++) {
 		struct vchiq_service_quota *quota = &state->service_quotas[i];
+
 		init_completion(&quota->quota_event);
 	}
 
-- 
2.30.2

