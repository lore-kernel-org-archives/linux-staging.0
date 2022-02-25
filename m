Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5B47C
	for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 15:56:30 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id p8so5027348pfh.8
        for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 07:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f+8G7tfQjV4ABkTw2q7bkb0w4qL2HQLeYpElCFm5+0A=;
        b=VCZCpTm8gU7mIFzNDCQAeyjVWNwhmu1TRcK5A69m8/XMTsoIWllTmkIupPLKk5z2+l
         uVvCna5KOSqGga2gVYdk/N7NnwPg8voVsGltJ6wo7DRp0w8Vmfyi05mVDiIHVEqAQ4U8
         TMUJUZAM907TANUSba0fmcdyC7zBOGZ47wmMs702JQDToRIv+uKjO+RZFthTuWaUMZum
         HilTGn3V760r0bJaqVpZ25uVKEZdYTstTyu2JyaKs+Vd3eHj6w+CDockKOg14xBvWrBC
         9FFkvCZz9hvsz3NNg0+pFmGlfiAokYd6qL7AUIpWy3hNm6wtW8TndKaNpH5Vi827m6Qb
         08/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f+8G7tfQjV4ABkTw2q7bkb0w4qL2HQLeYpElCFm5+0A=;
        b=7AOKcGElPeQwl67LuqFMmYPYEL/WNWssHvWJq32LyB6O5w20KsYjj5Y8HZN7Uw0ve4
         XvF3m0tdxUzri3cSxfGX95dvqe25cAaxwt4K/4UXDTlXWMK5Ww1Hfqy/avVDXmoQILxI
         Ja2ZOFX4pM0jv5eWS6dq0O/RxG/ljqOFVjE5MNzBk9GIeMfzMsC4t46wrBZ6RtFsHXyH
         de6Jj8cR11gs+BD8hEoS/Xhz3ZPsYalqwYX2ye7vm86mYKkFao4mL7oZEvkyc0F7dD2K
         rS8/I/vPyttnzWx6OkZGJfpcjVoAmhXyNf/S5luF08rWhY49i5gIKbiARWdZojlFxe8D
         cvjw==
X-Gm-Message-State: AOAM532ZnvE1dF+iPrpOohqeD71B3JJJs9u6EXylSPFAj6RBXjq9Jbtg
	A+CGAl16jQABdliCZiYzaBA=
X-Google-Smtp-Source: ABdhPJyKZMHrRt1ODKefYe6udSponfLE0sQv56Y0NLeGtURzbrTz0pYERo9eU71Qk3xSTEv8v+8+Ng==
X-Received: by 2002:a63:c22:0:b0:373:3d5b:ee98 with SMTP id b34-20020a630c22000000b003733d5bee98mr6515812pgl.252.1645804589451;
        Fri, 25 Feb 2022 07:56:29 -0800 (PST)
Received: from localhost.localdomain ([2402:4000:2281:554f:f1f7:ced3:4a51:c107])
        by smtp.gmail.com with ESMTPSA id m6-20020a056a00080600b004e1bb196743sm4150254pfk.5.2022.02.25.07.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 07:56:29 -0800 (PST)
From: Husni Faiz <ahamedhusni73@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: Husni Faiz <ahamedhusni73@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: av7110: av7110_av: Fix Switch and Case Same Indent Style Error
Date: Fri, 25 Feb 2022 21:26:22 +0530
Message-Id: <20220225155622.585621-1-ahamedhusni73@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes "switch and case should be at the same indent"
checkpatch error.

Signed-off-by: Husni Faiz <ahamedhusni73@gmail.com>
---
 drivers/staging/media/av7110/av7110_av.c | 30 ++++++++++++------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 91f4866c7e59..1d42862e9669 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -770,22 +770,22 @@ static void p_to_t(u8 const *buf, long int length, u16 pid, u8 *counter,
 	if (length > 3 &&
 	     buf[0] == 0x00 && buf[1] == 0x00 && buf[2] == 0x01)
 		switch (buf[3]) {
-			case PROG_STREAM_MAP:
-			case PRIVATE_STREAM2:
-			case PROG_STREAM_DIR:
-			case ECM_STREAM     :
-			case EMM_STREAM     :
-			case PADDING_STREAM :
-			case DSM_CC_STREAM  :
-			case ISO13522_STREAM:
-			case PRIVATE_STREAM1:
-			case AUDIO_STREAM_S ... AUDIO_STREAM_E:
-			case VIDEO_STREAM_S ... VIDEO_STREAM_E:
-				pes_start = 1;
-				break;
+		case PROG_STREAM_MAP:
+		case PRIVATE_STREAM2:
+		case PROG_STREAM_DIR:
+		case ECM_STREAM     :
+		case EMM_STREAM     :
+		case PADDING_STREAM :
+		case DSM_CC_STREAM  :
+		case ISO13522_STREAM:
+		case PRIVATE_STREAM1:
+		case AUDIO_STREAM_S ... AUDIO_STREAM_E:
+		case VIDEO_STREAM_S ... VIDEO_STREAM_E:
+			pes_start = 1;
+			break;
 
-			default:
-				break;
+		default:
+			break;
 		}
 
 	while (c < length) {
-- 
2.25.1

