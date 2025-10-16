Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580DD334374
	for <linux-staging@lists.linux.dev>; Thu, 16 Oct 2025 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626451; cv=none; b=RVSQf3YjfvbIzULvLlsFV2cApR3bAdR1jN6javvP31jhUxL2fmK5lfWVg3T4Ed4U/nMZ7/iKPhVESmwB7fE7DGncgWP95rrcF6FSR/MeTI3TJJIMFyk/1REiAPMosEzO2horH1vvIZVzv9t9JURpICqU9pc6KY/a8PrB5v9xXN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626451; c=relaxed/simple;
	bh=LZFsOZrVRCDVwFFcZo4n+HvCzaP6fIj6Q+Rj+KD3zmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fDYnC4/rOglKlhLGGHkPeGjhcT7+02dKTzRcKpLM62yNc4QujL1MvJ7OOtiQXrZ7qoVL/A69FJhHYFFvNUMpaAPxkn77t37jAOcEWCCsRpqowaD0EH6/lj5d5u3NzDW7AGeK64RYM3xOuy150hRUoljBVe5iVemMdtZiXRYjrVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YaMxpm+D; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YaMxpm+D"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-633b4861b79so140746a12.1
        for <linux-staging@lists.linux.dev>; Thu, 16 Oct 2025 07:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760626448; x=1761231248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YTIGUkNu9V/1qYLj6XWcbndfB5OHJZOyieZ7GKiMOsg=;
        b=YaMxpm+DoGQTePGuokTOS5ScG3Rmq6Irn7p/Paly1nJh3bMzy7YST45COenwrJw/pb
         92thAu+8TVY4HqTHhERZP0ku9bL1+LJKD4R8VieZktgxj5u6yDphyI7KmlyIS1xfSxXA
         U9udozZZ6aMt89hEWkF91FUgOe7TDXeiGzKW1YSgFSnU4C0/xK6IRZBBaWvwZ1nVvrAt
         +cLyw7FUhuE2tCndQk95di0eW32e8dnrgnEqJu3UxvJMVblCv8QpQhp4QLBeDk0HHA5Q
         lnCMx+HBC4uBORSeDZ6bgZhiD+glGAa9RtkbvCbvsyT5cO0d2pJu94ndruSwUNU7/19O
         jpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760626448; x=1761231248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTIGUkNu9V/1qYLj6XWcbndfB5OHJZOyieZ7GKiMOsg=;
        b=JYR/aWXco86H/aoeTLcBKUgvpylRemGcyQXCB9cnMrebQrM5hUluSbrn4hBhn+dL4T
         x7cuWjy3ykMt9omoJcU5+0mWF+62TYEWYFA9phJdOcJQZPEehU2Vc55e0GhVpkQjRQMj
         XWLyk7R+NSMFVVPpU3LFy6SToU66Zv05cb2Drp2eXwyogOI9BdrXiLUB6rm+gpa9aH2n
         /Uu8IWcpruoBjhtDdTWPJ2zkcx96iiH6jzkUAJRDrGet2DXws8KfPw2l3sjuEWdyXE8b
         ykOGikEitVNr7iy/nNYWFMJwdOJ3FlVo0tqUrTN0z6I1JAbqE+IgA3EAbtAtLo6d2E+j
         5Gvg==
X-Gm-Message-State: AOJu0Yzp5fiPMUwky3Htkkgh76ESj58l2gC9g9UsX42xcs3q7pqjhz6y
	a8FP18YmuooJPaIm1aoUHBucfzEGkNvugD92z8weOMI9ABbvhVM3syiRPy/Rz9D0yi4=
X-Gm-Gg: ASbGncu34W27mqJkYeXfT8DQ9h935eRQP+ahOlImm2BiawKyHFxR2RzEHSVLXqvVmk/
	EedCRpjd7XVm/uS4iPFoR9mnsv+CjoTVz7TH/MtZBIx70RMwcGuE8uYs0TXugyvGwPUI+FQ30M6
	hvS0J03PuTaCP2JHRT7CLUA7dL1/3I5ua2q7cD5uO3DQS7cB280qI50XzelW1Tv3MUFVUBAwcJT
	icerAbmlxRaXeRqdahGXxq796WdAra+3tx9FUY1NMTDOlSP2K1ooj/xRy2Gzd+zfJIMrJWPMnUU
	/bSmv23szzc169QHwVFmPrhE4m0mrq5kzJGvzsULAWYjaAw96WdscV5IA4Hnid2iZ106QpMnm6A
	eRPERQnV28pzLjO+w4p/lDTxEoDKC13qd42GYUD1in9DKEyE59R3aws5PqYTy1rTHL4Buz/e57A
	V7q8DxIK/zgb+clbq7yIqHUONF1UMeTk2C
X-Google-Smtp-Source: AGHT+IGzUSGewBTVeAPfSvkfVF6aHO8q20s8fVMtTmVOLPbW4X0QU+CJngwwXjaca0VMELonLbNaNQ==
X-Received: by 2002:a05:6402:1464:b0:639:eed9:14ce with SMTP id 4fb4d7f45d1cf-63c1f6d4920mr76539a12.8.1760626447428;
        Thu, 16 Oct 2025 07:54:07 -0700 (PDT)
Received: from fridge ([176.216.135.115])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b7144esm15841591a12.23.2025.10.16.07.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 07:54:07 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH] staging: nvec: remove NVEC_PS2_DEBUG and dead debug macro
Date: Thu, 16 Oct 2025 17:53:24 +0300
Message-ID: <20251016145324.13537-1-emreleno@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NVEC_PS2_DEBUG macro and NVEC_PHD() are unused and only add clutter.
Remove them completely.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/staging/nvec/nvec_ps2.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 575233fa1677..c89f3de0654c 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -23,14 +23,6 @@
 #define DISABLE_MOUSE	0xf5
 #define PSMOUSE_RST	0xff
 
-#ifdef NVEC_PS2_DEBUG
-#define NVEC_PHD(str, buf, len) \
-	print_hex_dump(KERN_DEBUG, str, DUMP_PREFIX_NONE, \
-			16, 1, buf, len, false)
-#else
-#define NVEC_PHD(str, buf, len) do { } while (0)
-#endif
-
 enum ps2_subcmds {
 	SEND_COMMAND = 1,
 	RECEIVE_N,
@@ -70,18 +62,15 @@ static int nvec_ps2_notifier(struct notifier_block *nb,
 	case NVEC_PS2_EVT:
 		for (i = 0; i < msg[1]; i++)
 			serio_interrupt(ps2_dev.ser_dev, msg[2 + i], 0);
-		NVEC_PHD("ps/2 mouse event: ", &msg[2], msg[1]);
 		return NOTIFY_STOP;
 
 	case NVEC_PS2:
 		if (msg[2] == 1) {
 			for (i = 0; i < (msg[1] - 2); i++)
 				serio_interrupt(ps2_dev.ser_dev, msg[i + 4], 0);
-			NVEC_PHD("ps/2 mouse reply: ", &msg[4], msg[1] - 2);
 		}
 
 		else if (msg[1] != 2) /* !ack */
-			NVEC_PHD("unhandled mouse event: ", msg, msg[1] + 2);
 		return NOTIFY_STOP;
 	}
 
-- 
2.51.0

