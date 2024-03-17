Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398BA1F934;
	Sun, 17 Mar 2024 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710703607; cv=none; b=MKXu8y2MN+F0eWNp3ya+iz3K75YQ+HSwyQi40bhwQTZOpSK53eNT38mX47loKqPhvvX9V92tsCyEFwPaH4aiT5+M7PWV9QHO1Rg/1V0vmQNj6Gilfzlp39DoeHKLxCwdV0GQIRobHvSg4SOvKWJucWQxHeHodNwi0atyHuI7yjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710703607; c=relaxed/simple;
	bh=5iUakWHZ2xIUZce/GJzvI7SGPPKCVQXi7v6lz97ehJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irUTbIKRU9ummAfQsLQJGVHc2mS8MmfdGsLjmdFMDYN2p0j86SEtNz5eBcqX4xaNc+k5DO8dh49bOSilqwifGrXPUi2S6HkNKxLmlH+eyquicqOFKq1Po4mYqT3UXVuRMX8PHGG+NSYxNl6T3e95eXnWA06FLbDGYu6Fwqu+Nq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YF/J8Qt1; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YF/J8Qt1"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so2937225b6e.2;
        Sun, 17 Mar 2024 12:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710703605; x=1711308405; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VjzizuacV1B0CmkeG2qTNIJqlqeCPwMo2mxSMnDyLWA=;
        b=YF/J8Qt1luXuGjTS1ZvfLFG1ZZ1R8DxwhNFI0XyOXtC4HsuN/wIaE6InNrSiT6xFOe
         1QBrr/VzcHl1jtsPx9TzKPQlt+9a7UAo1pPC3aiYzlMXhlhNcGHaNrAiUhquUaQgkhgM
         W1mtPu5e+8TCueEzf6lJLhsvZRYHXSLE0Qek6wWXTuQB4P7GeYBGdyzi7xiri8we/znh
         cnP1oOhtg+pg0EmwEbDZkjijsvKpYgO5lMwECFgOJFLp0a7Z0VENfU6WRzQyWO3GecN3
         gYmSl9ELKP6mc8bAv8VQZvVj6hS8vaQwwNxvLzyP6sPBcwLrkm9IltBEg1U1vbro9dH8
         FAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710703605; x=1711308405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjzizuacV1B0CmkeG2qTNIJqlqeCPwMo2mxSMnDyLWA=;
        b=jCXucQwitAvMn6HeT1fvgeqEJ2earyckhiXv+WZUR4ry9Rr/Mx/BPcBpzB1PYclj75
         QHyej7KW9DxbNcrAGZDrxapLC1Wd7f+/ZdKxuxEPa2LUzhmz0UySO9IJ6SGqsdqINPux
         3PtoF0FDoMYNBihAlrHFTRCAYPNNREctTgakXOg9hpPBQmu15b2GF3g1ZikNC7s+2zjb
         E/o96eHei9fFTuWH6vqpLEIn6ruqTgDmEHylQ7uAfR8S51byHtqJJNF4f/WIUO9IrIQm
         pO00BCjLUTeypZyLu393dXT1woVLjaQHWgnjE5FJjUNLE62B55A1/MI+7A89/Ppc7X6K
         nXwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLimVOUzlzREwbg0c8xp9Mun5kgDvGX6STX9Kle0CzU/sYpximrvAe2PoPhYVGdI7Gscde3kUJqp1+TIFbPqVxTurNvw7Q2ohOIF0/SA==
X-Gm-Message-State: AOJu0YznpFof/It//L4jfK7ql9LIxlSL7uOnwfpIAgwe0okNzQaK0/cn
	WX5B8r0Q4xTBEiUaAeosvlRzWMY/YLYXeDM8mbFyNvqOJCnrU4y1aYYb1DvsnA0=
X-Google-Smtp-Source: AGHT+IGda7+ZYL5afSY/gJ9PcukxWWU9Y7XSgHzAQLDMspffQybuCpOLss4QAqvbuIJV3GYkoxefug==
X-Received: by 2002:a05:6358:284:b0:17b:5e32:6009 with SMTP id w4-20020a056358028400b0017b5e326009mr13708650rwj.11.1710703604795;
        Sun, 17 Mar 2024 12:26:44 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id r19-20020a63fc53000000b005e83b3ce8d9sm2110917pgk.8.2024.03.17.12.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 12:26:44 -0700 (PDT)
Date: Mon, 18 Mar 2024 00:56:42 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH 2/3] staging: rtl8712: rename backupPMKIDIndex to
 backup_PMKID_index
Message-ID: <279456b8fb09414316e626663d70650f4a3c1d98.1710703217.git.ayushtiw0110@gmail.com>
References: <cover.1710703217.git.ayushtiw0110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1710703217.git.ayushtiw0110@gmail.com>

Rename variable backupPMKIDIndex to backup_PMKID_index to address
checkpatch warning 'Avoid Camelcase' and to ensure adherence to
coding style guidelines.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
 drivers/staging/rtl8712/mlme_linux.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8712/mlme_linux.c b/drivers/staging/rtl8712/mlme_linux.c
index a8cda81f4240..ac8196d24ce0 100644
--- a/drivers/staging/rtl8712/mlme_linux.c
+++ b/drivers/staging/rtl8712/mlme_linux.c
@@ -87,7 +87,7 @@ void r8712_os_indicate_connect(struct _adapter *adapter)
 static struct RT_PMKID_LIST backup_PMKID_list[NUM_PMKID_CACHE];
 void r8712_os_indicate_disconnect(struct _adapter *adapter)
 {
-	u8 backupPMKIDIndex = 0;
+	u8 backup_PMKID_index = 0;
 	u8 backupTKIPCountermeasure = 0x00;
 
 	r8712_indicate_wx_disassoc_event(adapter);
@@ -99,10 +99,10 @@ void r8712_os_indicate_disconnect(struct _adapter *adapter)
 		 * disconnect with AP for 60 seconds.
 		 */
 
-		memcpy(&backupPMKIDList[0],
+		memcpy(&backup_PMKID_list[0],
 		       &adapter->securitypriv.PMKIDList[0],
 		       sizeof(struct RT_PMKID_LIST) * NUM_PMKID_CACHE);
-		backupPMKIDIndex = adapter->securitypriv.PMKIDIndex;
+		backup_PMKID_index = adapter->securitypriv.PMKIDIndex;
 		backupTKIPCountermeasure =
 			adapter->securitypriv.btkip_countermeasure;
 		memset((unsigned char *)&adapter->securitypriv, 0,
@@ -113,9 +113,9 @@ void r8712_os_indicate_disconnect(struct _adapter *adapter)
 		 * for the following connection.
 		 */
 		memcpy(&adapter->securitypriv.PMKIDList[0],
-		       &backupPMKIDList[0],
+		       &backup_PMKID_list[0],
 		       sizeof(struct RT_PMKID_LIST) * NUM_PMKID_CACHE);
-		adapter->securitypriv.PMKIDIndex = backupPMKIDIndex;
+		adapter->securitypriv.PMKIDIndex = backup_PMKID_index;
 		adapter->securitypriv.btkip_countermeasure =
 					 backupTKIPCountermeasure;
 	} else { /*reset values in securitypriv*/
-- 
2.40.1

