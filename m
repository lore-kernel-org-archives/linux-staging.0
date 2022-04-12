Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F48E33C0;
	Tue, 12 Apr 2022 19:59:27 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id hu11so17003211qvb.7;
        Tue, 12 Apr 2022 12:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fGAe3LTsLkVSOmk5n1hYimC3Z+ei70JewOhDiYGXx2E=;
        b=mslVj8JNqY9h+etDhOaW5IR2IwPsASkEDfpx83ZM2H2oVURCRCLVverPb8AZ+5I+7I
         Yb4OLW38VZJrs5S4gGLSXXmcoXjjwrc3ryA4XueJFySQj9+K2ezEKJGlHBSHuIrFkgL8
         cymhOrNlfiLJD7cZybUL48DLP1cVPFSmc8KvkkVthiOU/UiANl5gN3P760Wp2CLZ8H+2
         HZ7QamWgc10Lp5ppiCELrjD9/FKVWLcAKRcBQM96E6QRhKZfFqjxJAbz+EYrfhVYXP1I
         8+jeWQKYhoi1mfymtcD1vUpveqaeQDjjnVB6odCA4Wa9HwN1N3zhg/Fgo73iWbFmAYEh
         NEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fGAe3LTsLkVSOmk5n1hYimC3Z+ei70JewOhDiYGXx2E=;
        b=Zh6oVZEsY1MzwNohxlOJGYFqAAeVVtOwMIdldxvl5oHgRCw96yGj7820mX3Jcq8i89
         Y4mxf657cmuVbspkkgs02kalpW89J01fvT0Hr846k/CPlUMZeLIxNEquzi9s55IfkcFy
         yULKieqZU/YE+xDYplMMJT2QqU5M3KkA8MInaj4pUBFb9Ozrd9rvrCqwJRNUQlonrS32
         p7BSH5l3N/ODvZlx/gaz7Q1yiCeM1Ik2Ep+F9QXwqiUjhqPiIXP30zUelYVdRM+aNigd
         6ZaknKZR9Q44eGL3eik8VSClqkPQ10uUV49aJz7uh24gCld4pEJiBdV8ZOYecczw20NI
         nvEw==
X-Gm-Message-State: AOAM531cXDidbKhcTCAwBkAfsoBuD/XQKcj2olPpzXqizrLqkaADJ6US
	o7ANmqoGvCpukoecaFvXn2s=
X-Google-Smtp-Source: ABdhPJyyulonvQwzYbxt/mlsiQy6OiMMXokv29anfKFSczgkTC6EFhA44wlhlgNg6gRevoajn9OoBw==
X-Received: by 2002:a05:6214:625:b0:441:4934:3c8d with SMTP id a5-20020a056214062500b0044149343c8dmr5208428qvx.40.1649793566406;
        Tue, 12 Apr 2022 12:59:26 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id t7-20020a05622a01c700b002e1b3555c2fsm27270744qtw.26.2022.04.12.12.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 12:59:25 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: johan@kernel.org
Cc: elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH v2 1/2] staging: greybus: correct typo in comment
Date: Tue, 12 Apr 2022 15:59:14 -0400
Message-Id: <811ff26b07cf61efcc2814ed5033e8864ef16d7e.1649793138.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649793138.git.jhpark1013@gmail.com>
References: <cover.1649793138.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a spelling typo from 'Atleast' to 'At least' in comment.
Issue found by checkpatch.

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index bbf3ba744fc4..45afa208d004 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -445,7 +445,7 @@ static int __maybe_unused arche_apb_ctrl_suspend(struct device *dev)
 static int __maybe_unused arche_apb_ctrl_resume(struct device *dev)
 {
 	/*
-	 * Atleast for ES2 we have to meet the delay requirement between
+	 * At least for ES2 we have to meet the delay requirement between
 	 * unipro switch and AP bridge init, depending on whether bridge is in
 	 * OFF state or standby state.
 	 *
-- 
2.25.1

