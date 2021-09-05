Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69CB72
	for <linux-staging@lists.linux.dev>; Sun,  5 Sep 2021 19:12:29 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id w8so4509665pgf.5
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 12:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oClDNOQT+GLawQeS0dfRl/HargK9SobeC6dDUiHWklU=;
        b=UIwichcWFdQy45M0knSwKSVbXz1XtLJOaq0orKwSxLZc1eXBfVqk8m9/5k/7NsamGQ
         OKGJgZFhfl6G7vSR4WD14WuQAiuMDHQDLNlh7SFkHnAzIBV5Fm5okJ/Ffgrh8YjmetYY
         3RBMjP4QUNnSVz/RV693X8qImG0dvFHSKPycz9RqPI16a8w2fxiN91ntZXx6nQbEYftA
         J4Tx8gychIgD0QswBZI+H0OFnPayVOeQIAf95/FcQQ78V5957nkcmdAVJyfqTzFPcV4M
         oajXKqAegeafuv0XBpaa69ncrxZeS9qtOXZxLGrwmKcqyozJQdYuOK3CG8BqG9V85Etm
         7Wwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oClDNOQT+GLawQeS0dfRl/HargK9SobeC6dDUiHWklU=;
        b=Ue9fQrPZB3BLe7k9ZgVi+r585dxSmTsE1EWeK8LVaDbkvDvxxdcSKIeqcHtvgfY1f8
         43dRgVaUuvjaMIWfCGnddhgEiNSRN6NQkOqNbIDXawL2def9YZDWtOu7pd4w/1goD+a0
         vEkEsEWPSAxTWbcAWhqO6pzOs/JqzL6Q8R1pKecOCBUFudOOB2D6NXqmc6WvuzsjEtdV
         o1L53UXv9e0eHY0/oT622J0itrPBQIrg0SxC2A17AsIP1gnJnm08DdTJgdozwNASs5Mt
         nHAtLKIN2BSU1WvUS87keXjRmvCksWLqI4Pktm9Ybpd1jIVkFdU7Y2dc0NzM3kr84/bq
         M7qw==
X-Gm-Message-State: AOAM531AOgqiMm+DU8xE3/A21+S041kqX+IOAGsHIsLQ5R+KJyvi0ElE
	S32gI4NK7oqYFS3MNgKK3hQ=
X-Google-Smtp-Source: ABdhPJxRx62rob+PMFUIZGbCbl8wa8C9Sq228UrqAbu/HArueR/qJv3KRPszg+/q6h3KYjHYcHKolQ==
X-Received: by 2002:aa7:9056:0:b0:412:444e:f601 with SMTP id n22-20020aa79056000000b00412444ef601mr8621568pfo.84.1630869149398;
        Sun, 05 Sep 2021 12:12:29 -0700 (PDT)
Received: from tong-desktop.local (99-105-211-126.lightspeed.sntcca.sbcglobal.net. [99.105.211.126])
        by smtp.googlemail.com with ESMTPSA id h4sm4492638pjs.2.2021.09.05.12.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 12:12:29 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Tong Zhang <ztong0001@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] media: atomisp: fix compilation error
Date: Sun,  5 Sep 2021 12:12:21 -0700
Message-Id: <20210905191222.612949-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I am getting the following compilation error on ubuntu 20.04 with gcc 9.3.0.

drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function ‘input_system_configure_channel_sensor’:
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
 1649 | }
      | ^
cc1: some warnings being treated as errors
make[4]: *** [scripts/Makefile.build:277: drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.o] Error 1

I made some minor changes to the switch-case to keep gcc happy.

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 8e085dda0c18..58eb74edc953 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -1644,8 +1644,9 @@ static input_system_err_t input_system_configure_channel_sensor(
 	case INPUT_SYSTEM_XMEM_CAPTURE:
 	case INPUT_SYSTEM_XMEM_ACQUIRE:
 	default:
-		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
+		break;
 	}
+	return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 }
 
 // Test flags and set structure.
-- 
2.25.1

