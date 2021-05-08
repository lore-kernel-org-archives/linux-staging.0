Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522F971
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 13:17:24 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id x20so16729202lfu.6
        for <linux-staging@lists.linux.dev>; Sat, 08 May 2021 06:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IqIPJJa374NLUqCHGDm7/7oqA7WluXXWMUnsKHbUjRk=;
        b=G7n5QwQnqlHWJUyZlWJbQbm69J5Xhdd4p7ykcNP16YHE3yjOhG5FWBrjAoQnm6mas7
         lkFxD0jnTXMvr6+yXPBi5OXi3qQ+3ggbs14zLCSWTCcKQ9IdVMsA+NlymI8onhW20Cyt
         UPkEuJSpRezF7dyZ2pcktAYsHpwNCfNo+1+E8oaxujBDzfIaUQevAJimYHxvIXR1yfIe
         5ekOlL8B7M/DCr1LeTbYOQWUuVCb6j5CmCEBZgrIp/IjDCzD1QL7Myb0TOj1ue00NdHc
         UWOrAZjg0/77+X0NgO7YE55qttsAANzaonkQnelWyJ6MJdvvBUBYb+wf6asVbkw5BE1K
         SgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IqIPJJa374NLUqCHGDm7/7oqA7WluXXWMUnsKHbUjRk=;
        b=tzJiLqJQq8ZJIpWGfRqQ3Quk68421vn5/IwJJgrtOzGuZMaz/Si5ILIG14t6pTqIqA
         wIXSrp+pjs1lnEaJyvtCNMm77y77DD5g7MNJBCInnpz681U3LJjLYTCeeXuEW/JyyD16
         kUAAwHnl/mHxg0T0DRqKYd/F46uF2IoPBl4Jsp0HbRFSO/bYDWD9Dm9QE7xY/zUBKFDG
         ZhEOIkYSCl5WPKgsvuSw9aa2k7wL24RuMCcl1NV1GDjM72gTOHDlDmdwNCAEBbbSHLvm
         f6I4yx7e10+QUZDGDAjLFsRN6cWzFLbllBUoQ6bTIISN/w3ieXkRjSwbIdLelf15seQR
         HcNg==
X-Gm-Message-State: AOAM533J5jahPYw4cEYrKfDaf/LLsv/DBXDmaEZaBuICJsjCxjr/lzrz
	XpPImvFOvkjXh6pGKyDXNgKo2YFFceMlXg==
X-Google-Smtp-Source: ABdhPJx/fVUU6CXFP8zvE4NAJ35Rfkq3wppWAa7ttRNNi2uAeDj59oOGUAITF8ywkveV6DW0wKKELA==
X-Received: by 2002:ac2:44da:: with SMTP id d26mr10291008lfm.522.1620479842624;
        Sat, 08 May 2021 06:17:22 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.119])
        by smtp.gmail.com with ESMTPSA id m25sm1646566lfo.279.2021.05.08.06.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 06:17:22 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v4 2/3] staging: media: atomisp: remove dublicate code
Date: Sat,  8 May 2021 16:17:20 +0300
Message-Id: <3944cd10bb5a64157781b1e0ef044c62c05f07c7.1620479607.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620479607.git.paskripkin@gmail.com>
References: <cover.1620479607.git.paskripkin@gmail.com>
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

