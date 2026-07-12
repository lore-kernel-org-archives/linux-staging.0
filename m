Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C7B34388A
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 17:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783878980; cv=none; b=Z/wf7ZBpV0/EBWyTa1XKIKtFonFhuFYAiAyG3hXTkfwEINuomGXayu1IvHTeB7fpvWNZ/lVFISM+gRzF5R18sI6WKHG02vIPz+Kd8TU/kA24ibSgFqUOPejx9VcKw/77QwwXHU4lSFW3lF5MbEYVvGosWCWONZnmyOBwAWmVg28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783878980; c=relaxed/simple;
	bh=brmbtJPRR/UosCjqu2SRhICZnIvb6VR85u/2uQkUAtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gjNV83k7iJvOHUHV/U77jvG7zn2UsbnDnMluFFG8wF+APZ7sj5x5DnF+YumirYJXgAbJTjF/hDIgObyFvpRoP6BTfIeLkXFJ7mIOT15HdY9TDKi4DhGCNes8+0lF9xiPEALe6HgMCjgB8+iyejnM/VbFRMnpGhTH3RydrSwp2WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPiUBNQ2; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPiUBNQ2"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so4264598a12.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 10:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783878977; x=1784483777; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ubpZ3Yk3sdfnO02vAQBS28P8R60XnZFTGc0Ac6txbGc=;
        b=kPiUBNQ2KxmGbj8rSiL7oz0TACChKQexVSoOEWgJpO3EO5PK47NTwI8OB4y+VTJNnt
         ovGbSum/Yf6lNnLOVIEgFxx0sMBsFT69gahAYitlz+3S0brpNy4J09Scs9YwfFfg0Vwe
         onOZ5afWfCF/NtD/PJPkuiMMSgXpxhIxiU9fekszrVSHBF0BgswjAg7GHB8mzizU/ep3
         pG69bv4GsXguwVM1Ehcqt/dDN6DufXdPTBFJST/Rs1f1wqpuYbl1MrnDz6S2RDVY4waA
         9NxEXmL8/7AUHK2L7UiIOBx4gXCuboAnw+EKQzj17+Pr8ASvbq0GCOGonmdlry2xRzQk
         jzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783878977; x=1784483777;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ubpZ3Yk3sdfnO02vAQBS28P8R60XnZFTGc0Ac6txbGc=;
        b=rka/hS+Ig34tgN9fTyihY/lorgvZ6ynIOpc2wmuVK9ihgeprOv+P5fb5mrQ9EQjj+p
         C0TY7a0gjZr3v8PSK/XsqXLc3dEhVzflpKFP0lP+HXOR+wMTUhnDmUSm/eZVwoDP914K
         3vZPyZ4PkBKJt+ao89fkT93hZBVF0z/2/hbuFSoLzwhVSH/KEhK22SDyzPoi4O94QIqZ
         4VAmwcfYUkBD6wQE5UnX1YUCmQuU0kwx5rgJvO66PgYD+/l6thF3E3IxJQds4VBgtiv6
         mu2SuAFH6qoxjXFpm8eO+aGW+mSRJ9WHdAG559yqwjC1X03EllZOqyaY2Vjpun4i+joc
         iAWQ==
X-Gm-Message-State: AOJu0YxL/0x0G503uyHKQZiXYgP3r9DeWmHexrkzcUVyV+Mu0euzOfKQ
	m10v/Yy3/FxHScJD1hTFqkRG5W6hZXjdsgBNX3t8x6LAI9a3x6qAbREW
X-Gm-Gg: AfdE7cm95BO7SmSMK1hEp6xGwwFPCPQDSWq4pNEci+lC7hImF6Ol5qhNFBhUlISIowo
	XpbAC1/3q7rJLDX7CM77NmwjbIM6eo0Q01MoDU/R8VPSiSJ9VvWkExKYHuwTiJhlfbS+LNKvC0c
	g5p8KBmnJF9QdfpaSgoHjmAhWXv7QF4h9d+mhA/Xlw//nsNLgVF7LJP9WorGWpO6gVDcc+OBl2H
	L0nkRuNW9Rlz6J0slPdFL/d8iN9bIR5iD5OD+ZmqBCwBdiTdu/fnVq4SPgkYOQG+/ErW27XXiBz
	/I5DRdhP7IPYIv1hC20MH5KkAaj7iT1PgxgcQA5XVpJHzPRFvzZearNmARmP+X6rP2L1QZleVz7
	GG0MU3V8HtU7kZZbgtR7cOoRV8jIukRpbXDrxKS3LtQJWOH9bWV8Vn4zsA4UmQVahcorCpL4K9j
	xY/x1CHkmwZLmvbOsRIedBMRM9xf4j9lKldyH6pESIZSwoaBM+94IaFxObTtnX5f6d9rSmtZw37
	vAJxLOu8w==
X-Received: by 2002:a17:906:f254:b0:c11:f5dc:20f with SMTP id a640c23a62f3a-c161f3d2a3bmr208964366b.31.1783878977364;
        Sun, 12 Jul 2026 10:56:17 -0700 (PDT)
Received: from ThinkPad-P15 (50708C63.static.ziggozakelijk.nl. [80.112.140.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c1470325sm736466866b.14.2026.07.12.10.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 10:56:17 -0700 (PDT)
Date: Sun, 12 Jul 2026 19:56:16 +0200
From: Pablo =?iso-8859-1?Q?Vallesp=EDn?= Aranguren <pablopva014@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Pablo =?iso-8859-1?Q?Vallesp=EDn?= Aranguren <pablopva014@gmail.com>
Subject: [PATCH] staging: rtl8723bs: wrap long line over 100 characters
Message-ID: <alPVQEAdoUFjHiJo@ThinkPad-P15>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Wrap the dequeue_xmitframes_to_sleeping_queue() function declaration to
fix line exceeding 100 characters.

This fixes the following checkpatch.pl check:
- CHECK: line length of 126 exceeds 100 columns.

Signed-off-by: Pablo Vallespín Aranguren <pablopva014@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index ca8f01575b55..9f11d010eff8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -2135,7 +2135,9 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 	return ret;
 }
 
-static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struct sta_info *psta, struct __queue *pframequeue)
+static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter,
+						 struct sta_info *psta,
+						 struct __queue *pframequeue)
 {
 	signed int ret;
 	struct list_head *plist, *phead, *tmp;
-- 
2.43.0

