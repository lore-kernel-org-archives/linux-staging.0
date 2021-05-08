Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ADA72
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 12:21:49 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id v6so14976147ljj.5
        for <linux-staging@lists.linux.dev>; Sat, 08 May 2021 05:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IqIPJJa374NLUqCHGDm7/7oqA7WluXXWMUnsKHbUjRk=;
        b=WYDKYxHicDffBaip1TyN/ZJx+xbz+MQdC5sI3kmliq6kRkch0tK9Haocg5oNod1jWT
         7bGN2LzEYYFGt2jM84YtkZe6TPTl5IhHgOJb0WNIw48bD13oIozTCNkyLMObPe0pYDVc
         /Kp1h4mRfKaYB4nYABcdongGBh6xkfXNKg1UBFwbP3Cq6JcVvbEj9BrD2jGpc+zyFJD3
         2F3fs4MnJiw+pP/1ZmOQ4LZnaRz2yYOtzsh8DoRgxRexTB6El28hWDgfb02rSsJL+gx8
         lBBKbHsGFdRnZ1nmuZ+mZdP7qfZqxPFZeh9lj5S4TNXoJ5bhmmJAIDkqz9OjQXKafa5j
         gzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IqIPJJa374NLUqCHGDm7/7oqA7WluXXWMUnsKHbUjRk=;
        b=Y4vi14FIsj5lKD/7Njp5w+syu3u5JjPpXSP2MyYjTTRcvF8AjJwAc/8UU9wgKriebM
         qitT9GuFculRFqlKSJq3FnGYx8X/jrnFa6LuegOEDxI1/cJxzqy1p1fgFXi2Jl6G12tg
         F96DxfMMk2mlCAM1P1tp5/hS71CjS6QS73Y4iH06336E+NP1TaBIIdfROirAbMrf3W1U
         z/OsQZbsEB1VLCpgGlgXXL4Lvpq/Dry+rabYla4xg1RsV9op9wTFWOHkISxIwqNaJUzD
         zUO38YdAtvdrxOB4gVrvSgo1eBRLKGnyYtm8vOW54PlogcwBGoaUmZREiQfhTD8qTb+w
         eifw==
X-Gm-Message-State: AOAM530xCmWt3yZL9xMeWp3dBrzeMtU84XfbRINUJZhk870uPy0+dUuY
	XcvMN9LO8UJMQ8OSWXPIVdE=
X-Google-Smtp-Source: ABdhPJz4+Qg28+GuALq9DVmJOKQMbLxJVRcrkqxACl+vhpypuTy1ImL7lf0MZbmjx2OEKYw7vE2/Dg==
X-Received: by 2002:a2e:390a:: with SMTP id g10mr12209311lja.64.1620476507988;
        Sat, 08 May 2021 05:21:47 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.119])
        by smtp.gmail.com with ESMTPSA id v8sm2304437ljn.17.2021.05.08.05.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 05:21:47 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v3 2/3] staging: media: atomisp: remove dublicate code
Date: Sat,  8 May 2021 15:21:46 +0300
Message-Id: <3944cd10bb5a64157781b1e0ef044c62c05f07c7.1620475909.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620475909.git.paskripkin@gmail.com>
References: <cover.1620475909.git.paskripkin@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed dublicate returns and breaks inside switch
statements and useless return after switch.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 .../pci/hive_isp_css_common/host/input_system.c     | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index fd82997b11cc..76414b6b43c9 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -903,11 +903,8 @@ static input_system_err_t input_system_configure_channel(
 			error = input_system_configure_channel_sensor(channel);
 			break;
 		case INPUT_SYSTEM_SOURCE_TPG:
-			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 		case INPUT_SYSTEM_SOURCE_PRBS:
-			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 		case INPUT_SYSTEM_SOURCE_FIFO:
-			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 		default:
 			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 		}
@@ -1301,13 +1298,7 @@ static input_system_err_t configuration_to_registers(void)
 		break;
 
 	case INPUT_SYSTEM_SOURCE_TPG:
-
-		break;
-
 	case INPUT_SYSTEM_SOURCE_PRBS:
-
-		break;
-
 	case INPUT_SYSTEM_SOURCE_FIFO:
 		break;
 
@@ -1688,15 +1679,11 @@ static input_system_err_t input_system_configure_channel_sensor(
 
 		break;
 	case INPUT_SYSTEM_FIFO_CAPTURE_WITH_COUNTING:
-		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 	case INPUT_SYSTEM_XMEM_CAPTURE:
-		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 	case INPUT_SYSTEM_XMEM_ACQUIRE:
-		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 	default:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 	}
-	return INPUT_SYSTEM_ERR_NO_ERROR;
 }
 
 // Test flags and set structure.
-- 
2.31.1

