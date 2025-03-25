Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8592C25D8E1;
	Tue, 25 Mar 2025 16:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742920372; cv=none; b=Du/eJdUPAKTXXw7wQtFswr87CA5IrO4t8CYjcSZkmfT9+AoYchEHmeLN0G8UEtVbZpVB9hfCDblEKFd0Le7SCuJosxTId/0RF0rRMdxr8R/m43JxZFWjpDKM/GgqDFvoaESNGbNHE13QHyf4lLQ6YjARJqywi1E66Hjse4KG0UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742920372; c=relaxed/simple;
	bh=NSec+iBcn7Q/AJxbbFrWQy9WdryMOTeKoH6dL/cAgaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BvLyHCpasSz6OWQX19h/8hXLzt20ccpNQFGNl6gmdudF/BBCHOqv1POMgGMryWUFxOXajJO4DcDIqg0IaHhuj+jNsuZcT7Pgx8hFXvnFyDeUstSTegP3CkDkacd7QkyDiGnJEQ7oNFFA6lB5mnhylBWZkC+K7GLhSd86uS/N7IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QK9w8PHe; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QK9w8PHe"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso8793083a12.2;
        Tue, 25 Mar 2025 09:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742920369; x=1743525169; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4odgKTupI6gjEJZNLy+RWifMVtAgdHPam3xHzX2/tcs=;
        b=QK9w8PHeC4qQDMUQxwZCiFGOK34+c3XOL4JSFKC+VOioaOyXpL8U2x+QxorBtCjMMw
         KfwcSJwQNLIqaOLAr8BV+1gl++5me6Qr6oP0YyscYfZSEgMO2JakHnSoYYLfXP+3GUu2
         2d/DOH3jhUWejWVu98fpvfCf+OesV0FB/lmtzE5/OhhNN7agYqao7ZvPC0p1CscrxJss
         De4tyYbZVZKsGOubrw/ywwaKWzjE7uzZStilIWdi9kT9Uk8v4SnL01ZTog9N8QFH1kWs
         SRGBqpBQx6nT5tg662c0xiOg0a3d3gwE9Rd8GGAox+l9bFjhRRxB8Nf3bHVU9ls3Mt8Y
         B/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742920369; x=1743525169;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4odgKTupI6gjEJZNLy+RWifMVtAgdHPam3xHzX2/tcs=;
        b=rboESOSnBe+LpixeY8yU0mQou+gg/f7OYqO3fGlqXvhoXgYWgb7n+sb8hbfU6b0MHv
         Ss4sNpWDYzWMBv+U8NQ2kJYcUhERMpmO9iZLTp77PNmN65f6pYQGZCCgAp5D5MKw3Vih
         kCScFTJbY4NXNGctn9InVCThak9PqPOjVY2dKW7bfUe5mVk6zC1ITSLVfZv2ttMPXqjD
         xJxhe8fuGFAfaz13gW3+LzyWObcFMaI3nH+DcyjSut8dTRSJgE/r7StuVhQb7yrCZTFD
         FTtTwbd7iSEjtpXeuhpsfprxjQT2ZJgrRoUC0dd89+fTpIM9+5tk5lapHwox6UOjBF3i
         Aa6w==
X-Forwarded-Encrypted: i=1; AJvYcCVNUK60uY4tSeu75W+cQdMGsMiBdXR9y8lkszL4YC+qVSzR8feEoTOszkNc7cX1+DtmA6oIn81SSjE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0ckc86ZsC8qr5WX1mIliMhTGa2yE7HJr0oT+AuciVd2R6uNuG
	JqML05m6FL4aL4ChW8/8JcD4ExlF8hIj7QQ8Lwb7scp/U6SK24NMdgSJX8yF
X-Gm-Gg: ASbGncuB3DkI+VNY911Aidfcu7QiVBXvONfmGhPAF++HI21tXmTSJbxw/RPFb11XZDe
	xQC85nAQtVO5VzoLkwfxiaNl7YQSiBgSWcd+IcRBIOrM7bGGvxaArJK4Z9Qkpt6jfEZl8ZQDlY8
	wV8p5JsAgaaQY/yQyVQJL2eePDzRmoAX31Zv0azSi8jxxTxLKSpyT4z6C+9wrhIppRmnBBDL9kZ
	kAVBe9viPOgJxHbJH2APQ5WF1BNWzXnMpNnH6jYuqffFQUNj3N7hA7efnxx7ADK6b2q+vf8CYeL
	sa1aprbFX/mIlXarl5zEgPAePGUoL9eXtG/cYFUqSCC+LaziJQ==
X-Google-Smtp-Source: AGHT+IHVgHE8zQfANSq9zhdazHfrmTIr8aqswsXlpCS61/JJ0ZXz7XZidItYALPPaLUJjU2St1EgHA==
X-Received: by 2002:a05:6402:13d0:b0:5eb:9673:feb with SMTP id 4fb4d7f45d1cf-5ebcd4f8250mr15323553a12.25.1742920368472;
        Tue, 25 Mar 2025 09:32:48 -0700 (PDT)
Received: from HP-650 ([105.112.117.141])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0c7157sm8011720a12.60.2025.03.25.09.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 09:32:48 -0700 (PDT)
Date: Tue, 25 Mar 2025 17:32:31 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev, Julia Lawall <julia.lawal@inria.fr>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove braces around single statements
Message-ID: <Z+Lan0xeQd3m5ejY@HP-650>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The code contains braces around single statements in the if blocks
which are unnecessary according to the Linux kernel coding style.

Remove the braces to improve readability and maintain consistency.

Reported by checkpatch:

WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index c60e179bb2e1..b17b295e8d3c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -56,9 +56,9 @@ int _ips_leave(struct adapter *padapter)
 		pwrpriv->ips_leave_cnts++;
 
 		result = rtw_ips_pwr_up(padapter);
-		if (result == _SUCCESS) {
+		if (result == _SUCCESS)
 			pwrpriv->rf_pwrstate = rf_on;
-		}
+
 		pwrpriv->bips_processing = false;
 
 		pwrpriv->bkeepfwalive = false;
@@ -549,9 +549,8 @@ void LeaveAllPowerSaveMode(struct adapter *Adapter)
 
 		LPS_Leave_check(Adapter);
 	} else {
-		if (adapter_to_pwrctl(Adapter)->rf_pwrstate == rf_off) {
+		if (adapter_to_pwrctl(Adapter)->rf_pwrstate == rf_off)
 			ips_leave(Adapter);
-		}
 	}
 }
 
-- 
2.34.1

