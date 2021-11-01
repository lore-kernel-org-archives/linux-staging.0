Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B0A68
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 14:32:26 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so2248051wme.0
        for <linux-staging@lists.linux.dev>; Mon, 01 Nov 2021 07:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ccxJHQnZxwCRL5ALIeLwb3BTgkZUnkc6gC/ao5xjt48=;
        b=UqbfzRP2IFjComwjTeq/suWfT5hLr3qKp728wk8yf7PbLSdilMsp9Pec2Kug6ifr+d
         XsBAajd6tuaF50om8XOl7ys8YVIST46qAJSLWS6R6Wmh3OlHVHoBaYzfFb0BOVzAlerd
         za63p3FoJUrrPWy6PwNypcccCNHaUUa3H5SLep9zuSjLyeCdRMO8CELHpMvT+UP8Uizw
         ZGkJGnzmKtMGOS7YgYYY1CtEQRSkRsin71fK2u9I81fG8iv37aKNJoDECVtps7x11aI2
         GRppSF4yZixWNE8gaypQ6kvFHK0VoAkJCWKdfvY8AGz59myd03/tSIaU/U0y2TD3gCki
         xCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ccxJHQnZxwCRL5ALIeLwb3BTgkZUnkc6gC/ao5xjt48=;
        b=fH6nUY/hmf9xXTAahBHeyRoxBqgAgnE+NySaQJXrjEps0TOvDWlVRHCkbGQ95GiTqb
         cuq2+xURoPIU2U+5sSrc3NPY0T4bZOhIGZhX65tjDJDaJR5saL84YWsKbizTF+KaPFZq
         10Q6yfbQtFI09M5y35NjVlBBRf6t/JUEHYHUJdIn6ZVOEDVE+NepqgAlhMfH9+0fJsF3
         Vj9ZcTo2AbMam8+F0gQyc+tHjz/cbRHuUk9d7mk9n+dUblo0iFt3hMbeqtf2finDNuXQ
         J49DX7YunUbj+cm4G1pcagLJDaIhfLXI3KQvq9NFpUp5jUyy1ZVnQnj0m81n/m7x/Ylk
         LTLg==
X-Gm-Message-State: AOAM532Xp6xkLEQXtkaCUPvCqYKXMGtQv+mVVxTsXbJts9v+9qOEPAk4
	gbA4n8Wb4+XSjlvjVhR9BEQ=
X-Google-Smtp-Source: ABdhPJyl8/YXTsw3KMUGsWCkDJgqsHPHgJ1+y10+sD5BokuAuBu7wtuYj8oygI0D11+vWOE/TDf2sA==
X-Received: by 2002:a05:600c:378f:: with SMTP id o15mr32286025wmr.63.1635777144591;
        Mon, 01 Nov 2021 07:32:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id l8sm17157721wry.43.2021.11.01.07.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 07:32:24 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH v2 3/8] staging: vt6655: Remove unused `i` increments
Date: Mon,  1 Nov 2021 14:32:01 +0000
Message-Id: <79a4f03c8f2bfa555ea149ddd1c0f938dd431a0b.1635773680.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1635773679.git.karolinadrobnik@gmail.com>
References: <cover.1635773679.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit c569952d92ba ("staging: vt6655: Use incrementation in `idx`")
rendered the incrementation of `i` outside of the loop unnecessary
so it can be deleted.

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index c07653566d17..ea74701917e5 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -703,7 +703,6 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 			MACvSetMISCFifo(priv, idx++, al2230_init_table[i]);
 
 		MACvSetMISCFifo(priv, idx++, al2230_channel_table0[channel - 1]);
-		i++;
 		MACvSetMISCFifo(priv, idx++, al2230_channel_table1[channel - 1]);
 		break;
 
@@ -724,9 +723,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 		}
 
 		MACvSetMISCFifo(priv, idx++, al7230_channel_table0[channel - 1]);
-		i++;
 		MACvSetMISCFifo(priv, idx++, al7230_channel_table1[channel - 1]);
-		i++;
 		MACvSetMISCFifo(priv, idx++, al7230_channel_table2[channel - 1]);
 		break;
 
-- 
2.30.2

