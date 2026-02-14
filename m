Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042781F92E
	for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 13:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771076446; cv=none; b=FtEYW86k+hsqWsTYfFhD9/Nk3KcRbC7PkvTtZinCYiPfHp365NnOTIHyg7z0iPNPOS2Ld9EBNjrKyIHoKsWxh/ddYJzYnV9GpeQKkJslDCyf5bGQfPB9LlzJ8cuYLEy6BnIRiO6kWljiij2bfMmR968GeP54NLGcF896+jRSJnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771076446; c=relaxed/simple;
	bh=hRMSMxumEXnPBa+Qy7bBhl/dDE2iX7HFUlyvz7Hhu/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bPUW9ola1fofuA7wEISCuMYKYN75Q9QrkG1RrcByru1N64TwYJJKjGwjiIjsLkbo+nZtZwa2868R24RoQz8+0TjEW5rycoMh1lIYAH3uDnOxHHw2ULL/N8wr6SB08NxKBZYkWy/ipIyVZe9R3wMDJA9tTaQVZhPTpM0ULZZcylQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Svb4PGTY; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Svb4PGTY"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82418b0178cso1063589b3a.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 05:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771076444; x=1771681244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mNnfpbKklMHqNw0su+CpvjYvdu1C5Qw8DfkMJ5hK5Qs=;
        b=Svb4PGTY4S9uEIURANBlnsv8Vkz4TSv1/V8Cn3HOOmyFuAV7c5qjFcgfwpGBaWSDnZ
         7NnFhj8H1RNHGijh8nsKZBEZDGC/VVkJe25NTteIQ62A+2ArjipqI20QR5FQ41nPA0Ya
         GvdesR7Sm8S0mSAReiKjd3hRmraMaue8BRXxu1HvbcXVp5FDq0dPFkPENlbrfIHAqbwy
         O6iRSSsXlwJHkGzy9TlSqT7n4qXpWmlmNYwNyCcN1Lax2iAcpKRrBMFJIH5rWzqiuEja
         1RTne+ab7Ci+zN5jsWLGMDg5jG1ICOM7ZFZX8RxCbkFHCwV64p/ZcHb4ys/FFxFVZVM3
         Uggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771076444; x=1771681244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNnfpbKklMHqNw0su+CpvjYvdu1C5Qw8DfkMJ5hK5Qs=;
        b=TrSNBAw1tHMcVYrLGNldMNi9CcKQVt5Ls4g5gswXPuc2ES/3ug2eWn8pxQChjogoWl
         ly1ivj1j6saPVEgqtG/cdlGJhJdNYLoJcxjlQ7qgxN+iHuIkj1iHKHhMlCpAGiRSjMyf
         Q7+CQnNlsQL7MZYvgzevePRXp7WiKJOQ6d9YXx4NTR9NQPlByDJirXnRacgu4oryRrvn
         fGRJ5CFYycpsn3mkFILuUtvC1O25EqHWJMfx+OcOqO92TTH3U1B/xWaG8dMxGtcQA2oV
         T9XP4dFLeq45QBq2QdZRlUUOr7/NpeouRwqJSLZnbSrPpW8mckbAxQjCMTB0pDsHnBUE
         WbTA==
X-Gm-Message-State: AOJu0Yy9vdH66QxNQcNobm1KLFDm1ixHommPqjB0jFKSUYSrwKb/Mwj8
	GEFqFLyon9EE2u7onh4qsPLpGdZj6E6zo7/dkCXgpMmnTdMpdxWYW6IM
X-Gm-Gg: AZuq6aJ7Utlje8UHHv79he9v2auhVPfC+gm/N9BL0ylLW5W24FY4XYv5L4g+ojGGKHK
	HQi2gFK2+VIp2+eQOugQaiObhWLglN1bHkIMnuiZi7MbMRk6PNxLaEluOW16D0+6p4Ap9332Eyd
	E2iar/S1D4u1cMLxkQpfCUCc8knAh+uZd0HgnS3roZ2LkjF0nzIwImGRWBSsMPcbtcxig9jcHZn
	nabUQZhEzK+TFx3WiqB6Yy283KxCWACqHDidbM3yITJzadbz/Fh+c+nWAEkeqmZG2pYweVED/n/
	lzfTanSvuo9JjwPmD2hoHDLlC8g7dxmtdHSlTpK8S6upXBgL5//krmDlsWCllqo8XUrJuh5SmIO
	kF4ESg+cuupgC0h5v4ltM3WBpTqZpz8B+QS9XUroyS95MuSZUuiDRjkNf/i2ESh4IWRuCDkBlIZ
	iM0epfb5ACijsJHqK6sjqVtMt2EUlfeGRPGJr3G33x5jxKQ0tUs7NXBQ==
X-Received: by 2002:a05:6a21:6d97:b0:38b:ea2a:284c with SMTP id adf61e73a8af0-3946c72effemr4416459637.20.1771076444204;
        Sat, 14 Feb 2026 05:40:44 -0800 (PST)
Received: from fedora.domain.name ([2401:4900:1c80:2960:2787:5d25:befc:bc27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a42688sm5465546b3a.21.2026.02.14.05.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 05:40:43 -0800 (PST)
From: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
To: gregkh@linuxfoundation.org,
	ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
Subject: [PATCH] staging: axis-fifo: remove unused header includes
Date: Sat, 14 Feb 2026 19:10:08 +0530
Message-ID: <20260214134008.21501-1-rajveer.chaudhari.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused header includes from axis-fifo.c to
reduce unnecessary dependencies and improve compilation time.

Replaced kernel.h include with container_of.h to directly
include dependency instead of using it indirectly via kernel.h .

Signed-off-by: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 509d620d6ce7..c90bf2d841ce 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -14,7 +14,7 @@
  * ----------------------------
  */
 
-#include <linux/kernel.h>
+#include <linux/container_of.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/wait.h>
@@ -27,9 +27,6 @@
 #include <linux/io.h>
 #include <linux/moduleparam.h>
 #include <linux/interrupt.h>
-#include <linux/param.h>
-#include <linux/fs.h>
-#include <linux/types.h>
 #include <linux/uaccess.h>
 #include <linux/jiffies.h>
 #include <linux/miscdevice.h>
-- 
2.53.0

