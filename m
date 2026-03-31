Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A15D3DA7CB
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 13:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965511; cv=none; b=M9O+eho8TdM/rYurvo18817VBrzuqDhASc8bMoWiv+C6k/3V7ry3Wbaj3Eyp5KbJ8jkYm2Xzpixv9J43UWMPdXH3fQ4sRbmg33nKrC6YxfTkm2yxt2PeEJHgaiProTWMnIXEG4M6obzK+BOV71g4da9cNUCgJN/dsYLm/Ovx8ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965511; c=relaxed/simple;
	bh=2w8IBapKnz1Sxld7KRM2gygjrEbTSCCsEM6TVnxX7CU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WhUxLqC7DTXzE9gn+KQ/K0hytL6ZsNpDa0xvEJ9MC/Jb5irLOnw5FnqCgWuf5MUog03cCEhIwzs2OqS1Sf1u4ZY6rZlSE9qWXq7yV1j0xilESJiDkpBtE/FN4lBZQtu+Naf52Gb6d4+/sQNjS7sXJsAM43+/7V2k8scjEHkQxmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbsNF4R3; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbsNF4R3"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2c7d8bbad06so168954eec.1
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 06:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774965507; x=1775570307; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2jTYn/FN3yNzRhPDPsyr3eRIifvRUFAJXluiCT4Y4c=;
        b=nbsNF4R3unV/am8qJpv9lRDqs791E6pT1exTKNLclK/Qvi1i91uyhZnr62O+yj8wR0
         2pVkSDfmYQObKnNUy25QaWrj3VmBveW0NELAWTT5NdZDFy1qNP+bu6a34bAyy1Rc56T/
         Sg2/o6XKuKML0bvF8jNYXacXreJ5ykbnsTpzyr4htVH1hP5n3ozHk4Nmq3sOeFI1bZ76
         SMdrKhWulOGys6QaP92eiX1gx1dHYJBeYX5Hrld7ZG7K4nWcZDQCzN4PwFUNIdtDttJ8
         oqx9Bpf1opOucPwf1TK2mtq/8rJdnSyjQdogTIByeawnyo7PvF9B1PfEjZiITsioxlRn
         PpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965507; x=1775570307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T2jTYn/FN3yNzRhPDPsyr3eRIifvRUFAJXluiCT4Y4c=;
        b=YemQPefmmaaGugbOqjAarjSvoGQcnvmLBbmxQV9oraHuPc3JGcLNxyJTVR5clwez6g
         I6x/9N3XEyxHbKh+He/Aw/Ur2QppeBb7TCwpZ+ejap8IOa/3GggRC7DrMSWGP5aGpF9T
         w5KN0wLhgFXR9WXw+ojLb6aqMrAXfBDQBqyto6xOapZyopye+phehtxjSttxQ7fW1bRq
         W4YOtNpl3KEKInC6LJSseNlspytRkZaW7IwUBPCzsPx5cNI0jMn3pyeOmy6D7gIshGRn
         58dNpHvn4mFrsElbcqPseAQwpk5I65t+1d3wJeT7w2lmiStwzjfCF58Wg6cnGRPGr5O7
         yytA==
X-Forwarded-Encrypted: i=1; AJvYcCXSq4zAsCzOqK+7siZKBsBurPFzDaw5M54B0sL78PI6TJ38/H3V7WEeNgxZsyk7VCa1177jHpNgoiswlnMZ@lists.linux.dev
X-Gm-Message-State: AOJu0YytBtdbILnqv5Xw1fRHWiZdY1I6WffyDIHTCwC0AXZHntZGXRFU
	xeReGnh++YmyLqJgy2/6HPkOtZuxBjQTpCgGlIQm89V6RQfRbNMc12Cm
X-Gm-Gg: ATEYQzzsMSalwi+xfdUpOMaa9tZyw+ZNs8OEwnqvdigTUS0FHVw8UkQ3aj7SyLmMlay
	Pto8y4G1Gxjjo1mBbtOvd6Tn3mgJiyJhJEhpJYxTCAnKeaaEiibytpINyXzkn8X9NXRAQxWSjek
	BMeRGaVl9z99AHX9lgftaLrDBvOlByQcOxMmxztToqQWIgGkLIoTrg8qDfno84vqVgD7GthecFD
	88Lok/A5ArjgyrB2QjGTumJRtAHw/PNu7BFYgXc39u2KyYTrfPDCVbahK+U2oAMg2qiQpIKNUQb
	CGbtmu8+QWTpuOq/pQguDvPt3S9E3XAi+yJRsPQ+1zma8np0xzwWn/ZzYVuN3av8yoTincYs3+m
	nSpvMmI9EZTOnKStszLpChQIwmxKWzjOhnX6iGWU7s9NQFB0AyW2MTR/5Ui3kOkcQ5nC/OXYbeV
	QkcoRRCvDKRuaaOMAKSpVBynmt9VNVGmLivL3ZYZeE5dRPp7j37f7PzUet9UXSoGz5Ywj03xKfs
	oNmfmG0PMbJXw==
X-Received: by 2002:a05:693c:3008:b0:2c1:6cfd:73df with SMTP id 5a478bee46e88-2c185e90d4bmr9416531eec.30.1774965506865;
        Tue, 31 Mar 2026 06:58:26 -0700 (PDT)
Received: from localhost.localdomain (58.sub-174-193-131.myvzw.com. [174.193.131.58])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c45dfcc95fsm8348215eec.29.2026.03.31.06.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 06:58:26 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] staging: sm750fb: constify fix_id array
Date: Tue, 31 Mar 2026 13:57:59 +0000
Message-Id: <20260331135759.19108-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331050738.1547-1-dennylin0707@gmail.com>
References: <20260331050738.1547-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Constify the static fix_id array so it can be placed in read-only memory.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

---
Changes in v2:
- Drop g_fbmode change as it is modified at runtime.
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 62f6e0cdf..795e9164b 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -740,7 +740,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		"kernel HELPERS prepared vesa_modes",
 	};
 
-	static const char *fix_id[2] = {
+	static const char * const fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
-- 
2.34.1

