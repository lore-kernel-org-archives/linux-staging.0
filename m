Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA6330BF4E
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 19:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782244366; cv=none; b=sTJq2cK7wKxdK2nPm/z4bCQU8GUd3c8IOqE6MLORwkPkliW0QbS0e62BFT/5ur0mBTVDYQ+j15w/AR33kFgzJFh/xUnMAPl8Ev+/Jk7l6/8x49w2FrRCCdvGKljyN5yiDZgPXfzhpgpt8HsfnhbFs59dbzP92mXfB2UXvniQ9Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782244366; c=relaxed/simple;
	bh=tmjhUBB1u98dLDU3QdbVkFNmoR5xov/zk3dBLRdPpd8=;
	h=Message-ID:From:Date:Subject:To:Cc:In-Reply-To:References; b=szNjsbQwlOwNhh+1NDrI6TXls14iexXtQ+VT4lAfcFs32ccabTmDRM6YSy8uJDfeIx2KxzGAtq7pft8ES8FBwNFrt58LpDY+FN1rC4mVdONNaQlNNkZaSuPK5/wqHb/ittt+a5h0RR+zMuOpegSsFqMwzTMewKYPb5ZVKXxJQvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVg0o50+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVg0o50+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so2149145e9.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 12:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782244362; x=1782849162; darn=lists.linux.dev;
        h=references:in-reply-to:cc:to:subject:date:from:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RwG/sU5n5vL9aQ5QUZES8N6P98eJf2PlCWhWLXHFgog=;
        b=JVg0o50+ftlNUaYyDtew3RH9lUYIDbEQa5oZ9W5dwrcaMNzeGQ8kCtv4aUxPc0jSxm
         gDJrk146Drd6wkvEt7vETYmUv6Dxvp/zvOJyC81XeysZlQnr9pN/eW1SZ6Qh186JFioJ
         0ObGCFywc7cvL9D1gYuqrR2GAgQ16nFRAEhIoIwCgwsr6XMXNNbKXt9p3dETuUIarDvS
         5Hf8WIDrwpqF6pF6DaQ7ZchOEk+g0xbVQIN4qlrFv5PAW4K67oBcVOM0ED3b8nwQH5U5
         UgrNZgu4eGyZoypI2x8lmb4Jb1Ehysv0Llf9sjT39W05/s0waGw0ShhbM+6UhaBaSvtZ
         /xKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782244362; x=1782849162;
        h=references:in-reply-to:cc:to:subject:date:from:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RwG/sU5n5vL9aQ5QUZES8N6P98eJf2PlCWhWLXHFgog=;
        b=B9X8iyVuXOFHHD1dvjr/fpQgmU8EjIl6kWjx6U4/o9y3j+uZVvFUQRJ0GfY3nJcymM
         sLEMWuwE44Y0x1EBhx4jk9scWDecNLkJdcOptr92IcpqC1jUWzawcKRdRgDXf1h4szb5
         9id8E02S5w+0fhlhsgfdS7jgfvfGQt0Gvtexf3M1NCJZcD1inLtARVRW7DCUss0EyKnz
         XSBihkVGcxmkB5cNqh5KBfgfX8K35BU0zFxaduC0bMoWDaUpkMxPlW7RPQfBYod9gO3o
         c89vgagPpNCCpU5DPEkIdhHHQQr/dhPzDb/iySmELwGtBeU7SgP3GyY3E+f4RjS+fMPq
         OzTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/oF6zCyOKk9EZotpyJ+Js6NRErIEaMroXy8eXVQhDsfHD8ckun8qQu5uBVxZPNypBqtOUmx3fOCBWQojE@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3PoH5pKlnylPKwhmX1Jv4MY5Cp5pNktQQKikylmFSdKGOagwq
	Sy8jFWwG6E8B9aNB690ELUfMwYaVgJVob1stdLnbZo3f27bfeqAR3AGE
X-Gm-Gg: AfdE7cmQMpd2Fu3RQtKUqJwSzG0K3gtx1OOnaN8ZDXkBC9lEn2NY1MIaLrsuNzFG77J
	qquQMxSbSp+++SqRJVVnL6MD6YuB2WroJld1C33Y2bwqqJO8WwTLVG212HJA7ygojdXCipFTpKe
	rlgF1DGiVfX4YuFgK0w52YMfA2MK/96m3yexL33T0/Rmv+XmWULHNvCDb0AT5N+1I59bw4hdccq
	au2lnNDvFef2CznaZp2CO+ul6KnyQrEDiz1tA4RtGpT9P5jqtzNp3iDnYozQmhFpGUoFI53F+/t
	tc+py5pJ8jIwzVQeNsQDaez1phdjTjXpXXahISuLwWe2MU+EIIc8BE7o81noO0WG3WSZwZSSfdq
	n1aA/fiCOzwajxvf98gEGHxFTo11/FZOKr7scre6dJv6dAwUDFtknLxznUM+Y5PRMDs9VVGSPAg
	cRjci9oYnldYJ2kSctFlQxQmt63VmOnEM+LV0OUrFMRJa73FgiN4Vyv0c=
X-Received: by 2002:a05:600c:698d:b0:490:e190:3b50 with SMTP id 5b1f17b1804b1-4925b359a37mr59883015e9.9.1782244362383;
        Tue, 23 Jun 2026 12:52:42 -0700 (PDT)
Received: from legion.localdomain ([92.44.171.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926064ea35sm6182885e9.1.2026.06.23.12.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 12:52:42 -0700 (PDT)
Message-ID: <6a3ae40a.3dabba3e.2527ef.7783@mx.google.com>
From: Batu Ada Tutkun <batuadatutkun@gmail.com>
Date: Tue, 23 Jun 2026 15:35:08 +0300
Subject: [PATCH v2] staging: most: dim2: use dev_err_probe() for clock errors
 in rcar enable functions
To: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, error27@gmail.com
In-Reply-To: <20260623124243.1245-1-batuadatutkun@gmail.com>
References: <20260623124243.1245-1-batuadatutkun@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

rcar_gen2_enable() and rcar_gen3_enable() use the old pattern of
dev_err() followed by return PTR_ERR() when devm_clk_get() fails.
fsl_mx6_enable() in the same file was already converted to use
dev_err_probe() by a previous cleanup series.

Convert the remaining two functions for consistency. devm_clk_get()
calls clk_get() which can return -EPROBE_DEFER if the clock provider
has not yet registered. Using dev_err_probe() suppresses the log at
error level in that case, avoiding misleading "cannot get clock" output
during a normal deferred probe.

clk_prepare_enable() cannot return -EPROBE_DEFER since the clock handle
is already acquired at that point, so those error paths are left as
dev_err().

Signed-off-by: Batu Ada Tutkun <batuadatutkun@gmail.com>

---
Compile tested only. No R-Car hardware available. This is a correctness
fix for the deferred probe path, not a response to a reported
user visible issue.

Changes in v2:
- Mention clk_get() explicitly in commit message
- Add testing note under --- cut off line

 drivers/staging/most/dim2/dim2.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 7953d4626..56f856d6d 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -974,10 +974,9 @@ static int rcar_gen2_enable(struct platform_device *pdev)
 	int ret;
 
 	dev->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(dev->clk)) {
-		dev_err(&pdev->dev, "cannot get clock\n");
-		return PTR_ERR(dev->clk);
-	}
+	if (IS_ERR(dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->clk),
+				     "cannot get clock\n");
 
 	ret = clk_prepare_enable(dev->clk);
 	if (ret) {
@@ -1019,10 +1018,9 @@ static int rcar_gen3_enable(struct platform_device *pdev)
 	int ret;
 
 	dev->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(dev->clk)) {
-		dev_err(&pdev->dev, "cannot get clock\n");
-		return PTR_ERR(dev->clk);
-	}
+	if (IS_ERR(dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->clk),
+				     "cannot get clock\n");
 
 	ret = clk_prepare_enable(dev->clk);
 	if (ret) {
-- 
2.53.0

