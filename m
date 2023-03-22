Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D608C01;
	Wed, 22 Mar 2023 14:54:38 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id r11so582017wrr.12;
        Wed, 22 Mar 2023 07:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679496876;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pX52XM0zRvUzVxvJJ0vn8RkPlcGXAVjIMg1ZZMuVw6A=;
        b=EqJVSA+xNvSC9aOZxnb40FR82uDcF+8Oj9rB3jgYZp+vaPQxRzWvXCU74/i0cCEcKN
         3cbSIA1r2CRpbKrIzSDGrSxzl2hXhBoLggzqBD5ypEkSSg0pa2qj+Jm/6EZYiWeNQFD5
         fULQ8GSCwnkm9dh87GcMj0vNq+jsdIPlAiRjAHQ1oI6OUh2kIG5W0ThE6DQv2ZcdjC7O
         75NRcHruEgJdMVPjrS+L04qEMjmvlYMGPsc3xV1ZnHFj6RAjyoRDai+FzZySbUZtrLQb
         fRmy7cgqdhpYqPiBD4n7o2SxAUFNVh8CgoQMUWqAfJ97LMjOFpHJntjJetRSP8r4fla6
         Fy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679496876;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pX52XM0zRvUzVxvJJ0vn8RkPlcGXAVjIMg1ZZMuVw6A=;
        b=RJTQN1+Kkc3Hn5IV3ai9bMs8k3R1/9QvMi/SBWCPHTnHMKWuS8i2FYPUD8FymjMHfT
         iKHek5a5vXJ3PkmxCvYbfbJpTzTJxRJsj+NXTfm268niZ9Ux47oAE8egRoroX8/UobhA
         3xB1guOgBPZwftLIfHxoMAcFTPSyMiIAeCQOFlKyqicdqxFcznjyh6XH8Cow0vaLVIbQ
         Wp67T7lL/MrAnmdMjPyzsePerVGKdGTpfGl/LAC9HC2RN7kmWg2EgwiGTsFI6elQArk3
         //Bj/pgXs7dXpJD61pnxhqLF57YdJU4nI7uFnMdydisutxq+dFAYcvoPjCgE6zuyEayO
         jupQ==
X-Gm-Message-State: AAQBX9ehXF6cHFbU3BO14N4gpj95bTfw6iOA87SDmS/s3rcsRdd5gfiZ
	AxV+3okRpCmAf6lf1LDZp4Y=
X-Google-Smtp-Source: AKy350bSRC+Dd6x/j8rAOkZ9rZcq8qbU0nauUKFSCJzSivumQ/SBuHylXSGyA2TzZeCPpSe07wBftA==
X-Received: by 2002:adf:ce01:0:b0:2cf:ec6c:f253 with SMTP id p1-20020adfce01000000b002cfec6cf253mr75143wrn.20.1679496876462;
        Wed, 22 Mar 2023 07:54:36 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id c15-20020adffb0f000000b002c6e8cb612fsm13946440wrr.92.2023.03.22.07.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:54:36 -0700 (PDT)
Date: Wed, 22 Mar 2023 19:54:33 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: most: fix line ending with '('
Message-ID: <ZBsWqT8lLAW383RG@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Splitting function header to multiple lines because of 80 characters per
line limit, results in ending the function call line with '('.
This leads to CHECK reported by checkpatch.pl

Move the function parameters right after the '(' in the function call
line.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/most/video/video.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index ffa97ef21ea5..6254a5df2502 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -365,8 +365,7 @@ static const struct video_device comp_videodev_template = {

 /**************************************************************************/

-static struct most_video_dev *get_comp_dev(
-	struct most_interface *iface, int channel_idx)
+static struct most_video_dev *get_comp_dev(struct most_interface *iface, int channel_idx)
 {
 	struct most_video_dev *mdev;
 	unsigned long flags;
--
2.34.1

