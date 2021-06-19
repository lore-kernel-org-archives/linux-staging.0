Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84152FAF
	for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 10:47:48 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id f16-20020a05600c1550b02901b00c1be4abso10316011wmg.2
        for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 03:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LTkyAehf8YDMFLVUk7PThGVVorkKOg4GbKlGuTWT6o8=;
        b=cmbaj81bapkWavHCB3MZVrkVnP/SZdNEKl67WB1irsh25jl7lvdLpz9waPXwilLIGl
         Jvc777Se48ju/+gjqm7sUKF+4Cnq5OzCjtPdGKVudIWptxQFYKC8zbDIfNq+xmAJHXrq
         GbumVzl7fK3+9jpHgLXnb+mB1gMC4QTWZpr6yPjakhbQQe0em8Bu/zd+FycUhymiXG6i
         HgFbOwJU2IcCAjoZI8rcLWW+8kxX33rJt3PyUmpDQnoIzWhMxnBymBnsDUjAaLFajXg3
         7whHdTQiw2xg/FeljOSIm5vhdzsONjt2vM/8bw3sTmmSyvmeI8k0Tejdg0jhZUzut2hu
         49sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LTkyAehf8YDMFLVUk7PThGVVorkKOg4GbKlGuTWT6o8=;
        b=LMWUpyficaddQUOvXE3WrD2YRNiwwjAP8GU9vrgANjrK05ZfsfyMOjnXuO3kpgoSFz
         fmGvEzhhGwR153Q/ZRm1JeU9eT8BLWNlibHiKKfOiNFvOPrZJ/bhQYcGxGvdoSIlUVwg
         qXXPHuJrbVB89ueI96nHCP2geqqCnsJikWiC1rzcVXMitqMzaXlikgygOIffR6zIhZtb
         VMCqj8eRhzExBcB1PO3AoZPaZe6xq84mZLGZRTklUrJ9F2U8rPIanVcoOAxoMj+aAQJi
         d2Nfvk/Ew0jCQI5IV6ECVjXnzwHV+ITYYm/ygmUlOf8/FzS+MPz++48h5rMRjNjgD3vb
         iuRA==
X-Gm-Message-State: AOAM5319p0MXBh/xzz/2Kt3C3VnJe3xMV5tDFRAfBWP4yswwOypHxbZI
	djjJU+jsE2sTFwVyBR7m8gA=
X-Google-Smtp-Source: ABdhPJwZX9Q4hG7OqQvle/LI4PetvpeUXzf5ZfrXzUvOBrPdIsGgKbmH0UnFzrb2Q0XwGCGWEsz70A==
X-Received: by 2002:a05:600c:190f:: with SMTP id j15mr15856276wmq.37.1624099667436;
        Sat, 19 Jun 2021 03:47:47 -0700 (PDT)
Received: from agape ([5.171.81.81])
        by smtp.gmail.com with ESMTPSA id f14sm11050322wri.16.2021.06.19.03.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 03:47:47 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/18] staging: rtl8723bs: remove item from TODO list
Date: Sat, 19 Jun 2021 12:47:21 +0200
Message-Id: <f85985665cd3d1a6e7cf4e6c2d63e7dc920fafab.1624099126.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624099125.git.fabioaiuto83@gmail.com>
References: <cover.1624099125.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove item related to 5Ghz code deletion from
driver's TODO list.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/TODO | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/TODO b/drivers/staging/rtl8723bs/TODO
index afa620ceb2d8..3d8f5a634a10 100644
--- a/drivers/staging/rtl8723bs/TODO
+++ b/drivers/staging/rtl8723bs/TODO
@@ -1,6 +1,4 @@
 TODO:
-- find and remove remaining code valid only for 5 GHz. Most of the obvious
-  ones have been removed, but things like channel > 14 still exist.
 - find and remove any code for other chips that is left over
 - convert any remaining unusual variable types
 - find codes that can use %pM and %Nph formatting
-- 
2.20.1

