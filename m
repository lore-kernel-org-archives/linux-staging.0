Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A265779DC
	for <linux-staging@lists.linux.dev>; Wed, 17 Jan 2024 06:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705471953; cv=none; b=nmHPGNWllZT5ZEG1o/Z+PdGsnzJlPeHLKIQF2oMy+lA4PJVAVQxDG4wbF7sqvmXz5YFcD8IyR80ru/sY2VO/QBZu6ZjI/rvkNSHQ8shskw21DZShUhqkQm+YT0AXi42tIoyF2XeDJZgUzsMfCSCu3gKLN8e6TvL6GykZ0VCE+TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705471953; c=relaxed/simple;
	bh=/O+i3bBbSGhrHffLTYKEuytn1lpaNu1aT4x1166hMzo=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nbn64Df+M/iUZVg0kuPsomNS+3mW5laA0wAQl5XWAeWY0u+mS+4DymrAHpEbiY1RZPuMSEQlmhJ9/zFQsxvo5iqfGZc201e1tS4YliMkVb+pbBT8T2Fcaz7rxddW8tQFxhJjJ04mQmTHkXVJiDg3dXVrY0CDmW1jBhsfa+3hCK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJf+9Kl0; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJf+9Kl0"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso8384254a12.2
        for <linux-staging@lists.linux.dev>; Tue, 16 Jan 2024 22:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705471952; x=1706076752; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VqTNHbNPjeR+iNnNOrzGjC0iGge9LE6I5Ajdhk+khs=;
        b=mJf+9Kl0tzX4SqyWtFWhNq9PrptaEQL8cnumgWZj5al+Ym6B0QDJxgZ/2BIoxgpf4S
         nnM1vZyrgdG4x/moRDaL+8IHl+lgKXf9ATRjg4HTuKrmzB28ZWyICukwfXXYskmSM4jI
         uaWsHzXk6FCvp7ZJNvvfepQcjMMTMaX74s8jgl8yqRtz8q5Sgzt+2F4IX0MB+StNs3wB
         BPIkdJXm/2oFjsh4iYI7VZXm/nuvEyaJVdwX9YNbiqfdxRna/ngOXqVrGNKPBOnUBquO
         t/ZzvZveYv+fxHZ58s4iBsabHT7EqhPzWnA7QJOM8CJ3p0UFf1QMTcvKrDZWQtSSpybp
         wZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705471952; x=1706076752;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VqTNHbNPjeR+iNnNOrzGjC0iGge9LE6I5Ajdhk+khs=;
        b=MnVZZhd0dRY8NkY3Bx5TNeY7VyVeZQv7hSDkUDZxnzvdruQP6ExKh18MO8e2D8oSOE
         MpXAqkcbEgCj1gdmF/OzuxOomIViLCYqHgnLtaBxtXJ2Q+ui8+9hGp00hBDXIQMuqCmy
         DSSOE31tOW/oJhBdFykwXOA+AKydfZdSW9oW+R82i05D2LH9iWtesFxmc/Pldsbr2hy1
         3jbhaiovSoq+Fgly4xQCd5vhVBPGdWLBLR/MGGK7b6SUH5ExKzx9uIXTIDVrF3TqBO4H
         8A5W5LDx0kgbaPbCW3KvyOvCuY7ZLnsYwfdG6hOzF2+x6+ZYj6MyPAGCpgZnuWzJYcbN
         VLyQ==
X-Gm-Message-State: AOJu0YwZ0iKqilVsf0nl2SEkNnNxFHiZvZkhkBMppslhf+UDIysgfu5J
	kd6J9P3yrpHJzTS1Letppa8=
X-Google-Smtp-Source: AGHT+IEtq5SYYQiA6hfQIqwyTvOpyyO8Pf/HvPVOM/ROBNgBa76wLMrUsRCMpteseYk9rocQRBlzBw==
X-Received: by 2002:a05:6a20:182a:b0:19a:589d:498d with SMTP id bk42-20020a056a20182a00b0019a589d498dmr7179205pzb.48.1705471951850;
        Tue, 16 Jan 2024 22:12:31 -0800 (PST)
Received: from LAPTOP-7VGLEE77 (19.216.252.27.dyn.cust.vf.net.nz. [27.252.216.19])
        by smtp.gmail.com with ESMTPSA id si1-20020a17090b528100b0028d8fa0171asm13194725pjb.35.2024.01.16.22.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 22:12:31 -0800 (PST)
Date: Wed, 17 Jan 2024 19:11:17 +1300
From: Hoorad Farrokh <hourrad.f@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: prism2mgmt: Removed unnecessary parentheses in if
 statment
Message-ID: <so663sd33rgvgzufcxe4oc666os2gq5nrdinqaqquksrkvnr3c@odkxhcxhb3ux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed a Linux coding style problem.

Reported by checkpatch:

CHECK: Unnecessary parentheses around 'msg->prismheader.status ==
                     P80211ENUM_msgitem_status_data_ok'

Signed-off-by: Hoorad Farrokh <hourrad.f@gmail.com>
---
 drivers/staging/wlan-ng/prism2mgmt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2mgmt.c b/drivers/staging/wlan-ng/prism2mgmt.c
index d5737166564e..a1adf69ba9f9 100644
--- a/drivers/staging/wlan-ng/prism2mgmt.c
+++ b/drivers/staging/wlan-ng/prism2mgmt.c
@@ -1288,8 +1288,8 @@ int prism2mgmt_wlansniff(struct wlandevice *wlandev, void *msgp)
 
 		/* Set the driver state */
 		/* Do we want the prism2 header? */
-		if ((msg->prismheader.status ==
-		     P80211ENUM_msgitem_status_data_ok) &&
+		if (msg->prismheader.status ==
+		     P80211ENUM_msgitem_status_data_ok &&
 		    (msg->prismheader.data == P80211ENUM_truth_true)) {
 			hw->sniffhdr = 0;
 			wlandev->netdev->type = ARPHRD_IEEE80211_PRISM;
-- 
2.42.0

