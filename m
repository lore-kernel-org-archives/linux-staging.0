Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A252C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:29:53 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id y22so139674484edq.2
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xjfPnUXitcaEyLb5Ye8HhEqApHDKZLLqufapqIWXgL8=;
        b=WpZWufid1BkMKY0o7xAk1Be2l6GDX4tbkOg383xcIHd7ohxo/bDv7yu98h+BmUYb9b
         k1WsNNk6MQPnPaYAf0CjZiiVsxG9BttwKvJi0og2wm4bOhYkW36WyDYmnEk/RZv6pwm1
         bbp4Oe2uQTu6phgQWtaIU/PgT210DeRw/K6YeFk2FdB2FdbPmWIwGxdamsn9iA1HMDLG
         Qq7LuTF/pNqnk/RX0M7a2vU+Vjp3tkp4MNCS/jJvdg/G7rYOoXLt7SI5q9EaUtkK9nTk
         KUJ6E5TMzH8Qh8aJzAKJAHovMK+QXD4PHLxOJFF8NzS1JCAcPAzRZwA6Y8Wv4b3/Q0gr
         FYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xjfPnUXitcaEyLb5Ye8HhEqApHDKZLLqufapqIWXgL8=;
        b=Jc+bjwgchK1cImu+pxSAu51pjBU8hrPJxvIHg/xQnTgkKNURPkKospRVK8qZqPoQnX
         WA6KO2ofPobhC08YjgQBcelpB+KGYY7CGfALWAjkN8ZD+VRof6z1IjoGlWjLAJu5p/er
         KImYIiwj/7riSrMeQ/SuPpznuNO/yQUtQSAZbWLaGX9+E9Sx56hmI1ZY39FQ4B6yMPVD
         FEKUetreqs/2wfKjE83FZkmkbcrscO2OJf53dtUmxRUDdyGwvMuvaNDb8/qALrBjjMw0
         etYb1pD+xb2P15BTsQem6d5cqNLR+e60oF4oVlyllGsJRiRFl22vWpzuHzY0n7DPuHA1
         mY2Q==
X-Gm-Message-State: AOAM532c89QSCZqj7JIGe7QXQVxij1mmvQLceo0bbXgZqR9jiqaIgTx6
	AP5GvrkmJvjz17cixnJpqKI=
X-Google-Smtp-Source: ABdhPJykYbDkLpeUh1OJK+m0GtK/62kLfNDDSNy3r871av3yDIGG2DFAjjVURBVdlmskAV5cgw80hA==
X-Received: by 2002:a17:907:97c7:: with SMTP id js7mr36071189ejc.84.1641238191535;
        Mon, 03 Jan 2022 11:29:51 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:29:51 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: 
Cc: alb3rt0.m3rciai@gmail.com,
	linuxfancy@googlegroups.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 26/56] staging: r8188eu: add parenthesis to macro set_privacy
Date: Mon,  3 Jan 2022 20:02:01 +0100
Message-Id: <20220103190326.363960-27-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
References: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enclose in parenthesis complex macro set_privacy

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 32ff5b2aed34..75a69323e787 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -196,7 +196,7 @@ enum WIFI_REG_DOMAIN {
 #define get_m_data(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_MORE_DATA_)) != 0)
 
 #define set_privacy(pbuf)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16(_PRIVACY_)
+	(*(__le16 *)(pbuf) |= cpu_to_le16(_PRIVACY_))
 
 #define GetPrivacy(pbuf)					\
 	(((*(__le16 *)(pbuf)) & cpu_to_le16(_PRIVACY_)) != 0)
-- 
2.25.1

