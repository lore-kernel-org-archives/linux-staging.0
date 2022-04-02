Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D517C;
	Sat,  2 Apr 2022 11:37:47 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id w4so7576476wrg.12;
        Sat, 02 Apr 2022 04:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w4EOXThxF+MGi8ejb9b6d/qQvr3UdpXe4etGNsWqJ3g=;
        b=WZuCEDVw2LR2yQ6AETsIWibNMg24Vzpx4X2HKWmaAWU9RK+r5aha6LWedcPfVnU97k
         phramPP57zS7p5Z34plHcu/WNXpoxe3J3+4pXtQuPEC/3lxOjILTnqLVK73HVomtW+iw
         1ylwZz6prPaTaGbrW7B7BC+o6lgovyRJHMcLwQ23Hy/5+ry44puUwoj1/wDp9VEKBP+A
         hUeeWC8BFsp7chwGoGJdfOGO7+aBYiXrVbu004EaP5hdzv9jT2mRTb5iOmwcQHzHhXp+
         s9tQTnP9HyygGEj/Ucc3nOjdxkqm7xN5o+OuhFPMzosj/T9HruPffwpPx9CcDiKxHeA7
         IYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w4EOXThxF+MGi8ejb9b6d/qQvr3UdpXe4etGNsWqJ3g=;
        b=j1lbSUcM06XC4Hf1VaEmknM6L2KTistWoUOSY/gvcU38EECKf/Hwb1mha5ZrylX3x1
         xdRk0woVvQShVAtNkOarYwftd70lp2iUX1o3wBnc4NsdgRAD2fHPqenE5d56qHDqKXQ0
         hrwI6tafpVOqP8KPM31B/8S0kZiRPnjMipy8JAVBjJetunwGIG8AaCPPmC8Avlg5uHn5
         KTJn2R/W54pWbbbQ7DYJ9eIPHi+5pRudvzuZ7fOZqJmuTt6wLcHNf+gnGIgAyLPtyvzN
         /f6Mx1mN4bZ5ko+EZpxmOf9t5/3YIpLV+fbE5YquAuqo3UAJFWPNJLgdeWuStke0rxSj
         PbYQ==
X-Gm-Message-State: AOAM531vzKI+s1Fyp+05NnbQMaeAjMWafc6CcZK2WyArxcfdgkxQMDHh
	0l67eSQ//d8wk/RYrsruNsI=
X-Google-Smtp-Source: ABdhPJwOIxcjt2ql8oFYOoOCVYT4/ctN3MdOJclpNzO7UTpg6OmIerqRPhm1nZp+rLBDjPMgu38cuQ==
X-Received: by 2002:adf:a450:0:b0:206:b29:2425 with SMTP id e16-20020adfa450000000b002060b292425mr535780wra.90.1648899465654;
        Sat, 02 Apr 2022 04:37:45 -0700 (PDT)
Received: from alaa-emad ([197.57.138.121])
        by smtp.gmail.com with ESMTPSA id a11-20020a5d456b000000b0020406ce0e06sm4348812wrc.94.2022.04.02.04.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:37:45 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH 0/2] Fix coding style in cfg80211.c
Date: Sat,  2 Apr 2022 13:37:31 +0200
Message-Id: <cover.1648899123.git.eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Alaa Mohamed (2):
  staging: wlan-ng: Fix Lines shouldn't end with '('
  staging: wlan-ng: Fix Alignment with parenthesis

 drivers/staging/wlan-ng/cfg80211.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

-- 
2.35.1

