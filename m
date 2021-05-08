Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2D472
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 12:21:41 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id z13so16622200lft.1
        for <linux-staging@lists.linux.dev>; Sat, 08 May 2021 05:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Y3teniSGRQ0VOrXvsmVmKBJjGDITdl3HQv9AqHHKVM=;
        b=qUhZ/yb9OCq6Irbkz738dLNIaV0VmA6sCNzwEoZSqFtOrugaCuckpFV4qAoTx8iBs5
         gwsgagjHgJ0TwQQeIZzOwr8Z9noGMt2QuRrnUPIi+Fn0Z7B8WQ8Ltu9QibLQUCDILlOz
         L5YD580dq5o6/gJ4DouDDSut90OaqD58yebStNTQcrufNBmPeacDLg0KsylV89vwp5st
         WSRYyBT7Ml0tbV6xACLt9l4/Eozq798OR0z0pnLfcOtkP52uX79ElMMzZ/UA3ZTykcWP
         TutfN5cFE8Y41xv0WQb+W/1R0IgBz4AoiGt6IBsT3XRPewdpeaRmVXQtU4c2eBy5yCh5
         nEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Y3teniSGRQ0VOrXvsmVmKBJjGDITdl3HQv9AqHHKVM=;
        b=IBs2wltyFW4eqrVSxZslvEUkYzaE9bQ9MvObcjmBddGCNc6AaIE+UdJli/+9zlBWoo
         WsO+bvS1AolMRndgQI02TAvEGDxaS3p/odav3v1nMVtOJmOkGwC8SIRPq+WynITL2TSA
         8KDPTvS/+Tu0eABX90rIBQMNX7s0XqkIuuIJTmKfEl2VvPy4UVxi9NopTYiJvTqowwUs
         eXafgTKVrHoV2ZGlfnmOQNKHeqv90r2B23HeFXvrRPzZS5xvmmiRlaRDmbGKFzsrBtg1
         SJog0SfOQV7kH+Y8sRGkw5H7NNYJtQyot697zPVX/6NUQdcUdVc9ioozBFtQa5G9MhVz
         7eQQ==
X-Gm-Message-State: AOAM532eJMwHMAKXg+NosjZZkFqhYxs/2Rmbjdnc99bEXsoSQ55rX30v
	DKOS3kJqlxRj9DBiBNlWCJU=
X-Google-Smtp-Source: ABdhPJyBr1q2ZOINPkqz8zKEjwYi0oogwmYRR2+QE2fm5uaihpdeQaplE1KkCL76rx88R5Y8R1/SNQ==
X-Received: by 2002:ac2:428e:: with SMTP id m14mr9790318lfh.478.1620476500102;
        Sat, 08 May 2021 05:21:40 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.119])
        by smtp.gmail.com with ESMTPSA id h14sm2283586lji.57.2021.05.08.05.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 05:21:39 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v3 1/3] staging: media: atomisp: remove useless breaks
Date: Sat,  8 May 2021 15:21:34 +0300
Message-Id: <4b4a6ad1bc8fc1fd6aafc3e6cd7a4969890340c1.1620475909.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620475909.git.paskripkin@gmail.com>
References: <cover.1620475909.git.paskripkin@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Breaks are not useful after a return, they can
simply be removed.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 .../pci/hive_isp_css_common/host/input_system.c       | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 0f5a231672a8..fd82997b11cc 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -904,16 +904,12 @@ static input_system_err_t input_system_configure_channel(
 			break;
 		case INPUT_SYSTEM_SOURCE_TPG:
 			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-			break;
 		case INPUT_SYSTEM_SOURCE_PRBS:
 			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-			break;
 		case INPUT_SYSTEM_SOURCE_FIFO:
 			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-			break;
 		default:
 			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-			break;
 		}
 
 		if (error != INPUT_SYSTEM_ERR_NO_ERROR) return error;
@@ -995,7 +991,6 @@ static input_system_err_t input_buffer_configuration(void)
 			default:
 				config.csi_buffer_flags[port] |= INPUT_SYSTEM_CFG_FLAG_CONFLICT;
 				return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-				break;
 			}
 
 			// Check acquisition buffer specified but set it later since it has to be unique.
@@ -1032,7 +1027,6 @@ static input_system_err_t input_buffer_configuration(void)
 
 			default:
 				return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-				break;
 			}
 		} else {
 			config.csi_buffer_flags[port] = INPUT_SYSTEM_CFG_FLAG_BLOCKED;
@@ -1319,7 +1313,6 @@ static input_system_err_t configuration_to_registers(void)
 
 	default:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-		break;
 
 	} // end of switch (source_type)
 
@@ -1696,16 +1689,12 @@ static input_system_err_t input_system_configure_channel_sensor(
 		break;
 	case INPUT_SYSTEM_FIFO_CAPTURE_WITH_COUNTING:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-		break;
 	case INPUT_SYSTEM_XMEM_CAPTURE:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-		break;
 	case INPUT_SYSTEM_XMEM_ACQUIRE:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-		break;
 	default:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
-		break;
 	}
 	return INPUT_SYSTEM_ERR_NO_ERROR;
 }
-- 
2.31.1

