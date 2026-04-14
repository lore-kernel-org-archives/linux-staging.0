Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BF53CB2F2
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160740; cv=none; b=raaF5su/v+gDL10fo9UfzPwikKuRYgblwu4Pburxk7Q3nn9IOLEP4oqJ1uMcekzfY0tiZPcjsLJB6R9y2WFldLZ5pF3KO+2uTkJSEXOvvL/Qc6kln4MfklnxfGDZAxFZWrKpYHY1i7e18kg+VgzGE3id/BxowpSL9kmWHwTPnzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160740; c=relaxed/simple;
	bh=gwxzik5q92+YJGCAF+mUsxbR9fcv6IwBv9/eAbKIU7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7Nvfm+nh6WVfVY6iozJubaXPbG+HiwZM4x6AdJcOcDYrWydzkG6vm7qUVFXT7pQdOZl4b+ofKeaFs2WNZly6SRSX5Psq6v76ceZwhBzb7JLvaaWTup1fRZDVYZU3W8yRiMe6izBYnwOsnBwrPdv7ho583F+1+JbraLVrbBZtyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q/ERoCE2; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q/ERoCE2"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso5744678e87.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776160737; x=1776765537; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shlfFrpNOrscj1KlCl4wQyL5KbFoUXtyOhECIHR0RH0=;
        b=q/ERoCE2+8fwBk13tN7DPAigLaOMtv8MSb5fhEPhwihATVmz3GR6MGNMOVAUgGj4gT
         un7xO758+wm9xJunO1DxHqNgGOWiNarsGZlAxgFNaFh6AuTCvSNrjVnQ2ZCN61YwpwbN
         7WGBVY7FDEUTwxHbPGg/48MBOSsMW6Du/zVnzXPImD5geCZ7kbXrqrKY6OormourVrxC
         hRyc2fvEae0qN/CgrHdOu8UA1ooK7/Xzby4IAXrQr3pmVn6t8ii3DP31jV+1LHgg9oEk
         x3A3Zl7wy4jU7pdkTLdLJYFkbFZVo/H2FhjN/LPBgdwGhrBkmHyFB2vS6plEPU14OAcd
         HzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160737; x=1776765537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=shlfFrpNOrscj1KlCl4wQyL5KbFoUXtyOhECIHR0RH0=;
        b=UAMH4RDyYjxiFf9LSJHftHuygelQDwfex9vG+Mn5JuA3xGLMrY0eWV/7fXWBla4f3c
         k0w6ZpXFhSXgf5FQM8QU57J8XeY61coUx0mNwakqYkSWkCkivJe0WAh+1WvjtH/uqwEe
         q+kvKXxiTZNmcvwPiB1mY3+EuQT1TgW5+p7H5Hd8xkoUXqNqlNFxEBh8yVybmkGHftvP
         fy8Xnu0zqe+jAvpiLBFiNesvm6ZLjCdWxqPeZnkO30syYR7YwASak2ulxrubOPLbMSQK
         SQ5++l2d9HIzr1A84BultvHLmqTa85IQFWyKnYsMRgFCN7clfZMlT9Cp7USOsR4Tk0CL
         O9Fw==
X-Forwarded-Encrypted: i=1; AFNElJ/GuGyLztTVfq9Dstl3Okg67SBc4mQpYjT5ySobHoNP7+f8XGxq6ZKqT38HXnXyEMWDvEaCHd+Oh894Zrg+@lists.linux.dev
X-Gm-Message-State: AOJu0YwpSZp3uz+GH4kn2w0YQUkcxqy7Kp/LPjZS241dRGxfoBtpvoJi
	az5AC+yOM2qRbdsJqf/JZR5Blle5l/1/3NnC07YHfVEAvDuazdI7fr1p
X-Gm-Gg: AeBDievnCjmqqUabaEk/HyiyZRR1W8mwNl7tRN+hdHKXML1JBd3QEiAgslNJnkPlOQQ
	nBGVPebXFg0p9kMMCavkYNyrBKSFC9vH0rRhhSXVd8PKwSp1CmUmrWxJbRdgTcgwDFZijCHjb+6
	XfV6iB3FWEfHVDk6lD0YN77yd2PD+Nxe3uyprdF0j7be1deNlRlL//gC6xbRk6bZIr9zGAkKuAB
	BzwR9A2CFnZPkHrg0KPW59BamiQXOC/EswrRrynSbWmRrw9jmYSbo+aGorvemJGI5ojhOZOj/iu
	s3wGVKXFZy32d0rQGr4nqt2nkQVP/l+WgcyNp7AmPgesJqa4oPnsF5AGGhCMbDm/LqeH7Q+Jtni
	XKYI+2brDPymHJarEhZ1QqD1b2vUaVbHiljV7gfSxm0Gwp4pMsYk+zSHeDDWBNDg3YDC954s9vw
	HKszRi5Y1Wt/kesQ==
X-Received: by 2002:a05:6512:3983:b0:5a2:bac1:97bc with SMTP id 2adb3069b0e04-5a3efea2465mr5028630e87.44.1776160736712;
        Tue, 14 Apr 2026 02:58:56 -0700 (PDT)
Received: from arbuzik ([213.79.119.79])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef071cbsm3208359e87.80.2026.04.14.02.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:58:56 -0700 (PDT)
From: Marc Finkelbaum <regpacy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marc Finkelbaum <regpacy@gmail.com>
Subject: [PATCH 3/9] staging: rtl8723bs: fix block comment alignment
Date: Tue, 14 Apr 2026 12:58:27 +0300
Message-ID: <20260414095833.76480-4-regpacy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414095833.76480-1-regpacy@gmail.com>
References: <20260414095833.76480-1-regpacy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the required space after the opening '/*' on continuation lines in
four block comments: the two C2H event format header tables, the
clear_evt inline comment, and the HW_VAR_DM_FUNC_CLR comment in
SetHwReg.

No functional change.

Signed-off-by: Marc Finkelbaum <regpacy@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 28 ++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 07e4da49d757..be8b5e1dbab5 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -466,10 +466,10 @@ void rtw_init_hal_com_default_value(struct adapter *Adapter)
 }
 
 /*
-* C2H event format:
-* Field	 TRIGGER		CONTENT	   CMD_SEQ	CMD_LEN		 CMD_ID
-* BITS	 [127:120]	[119:16]      [15:8]		  [7:4]		   [3:0]
-*/
+ * C2H event format:
+ * Field	 TRIGGER		CONTENT	   CMD_SEQ	CMD_LEN		 CMD_ID
+ * BITS	 [127:120]	[119:16]      [15:8]		  [7:4]		   [3:0]
+ */
 
 void c2h_evt_clear(struct adapter *adapter)
 {
@@ -477,10 +477,10 @@ void c2h_evt_clear(struct adapter *adapter)
 }
 
 /*
-* C2H event format:
-* Field    TRIGGER    CMD_LEN    CONTENT    CMD_SEQ    CMD_ID
-* BITS    [127:120]   [119:112]    [111:16]	     [15:8]         [7:0]
-*/
+ * C2H event format:
+ * Field    TRIGGER    CMD_LEN    CONTENT    CMD_SEQ    CMD_ID
+ * BITS    [127:120]   [119:112]    [111:16]	     [15:8]         [7:0]
+ */
 s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf)
 {
 	s32 ret = _FAIL;
@@ -514,9 +514,9 @@ s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf)
 
 clear_evt:
 	/*
-	* Clear event to notify FW we have read the command.
-	* If this field isn't clear, the FW won't update the next command message.
-	*/
+	 * Clear event to notify FW we have read the command.
+	 * If this field isn't clear, the FW won't update the next command message.
+	 */
 	c2h_evt_clear(adapter);
 exit:
 	return ret;
@@ -612,9 +612,9 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 		break;
 	case HW_VAR_DM_FUNC_CLR:
 		/*
-		* input is already a mask to clear function
-		* don't invert it again! George, Lucas@20130513
-		*/
+		 * input is already a mask to clear function
+		 * don't invert it again! George, Lucas@20130513
+		 */
 		odm->SupportAbility &= *((u32 *)val);
 		break;
 	case HW_VAR_AMPDU_MIN_SPACE:
-- 
2.53.0

