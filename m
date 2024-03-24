Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6813C199D9;
	Sun, 24 Mar 2024 20:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711313400; cv=none; b=nHMB4cLwM5AKQyrJtQFepWUU+1ETmmyfmNTNcnBZaa4bwN++4/MVgz9rLlxtLURU2HJHKDWNQLS03OZs5kA8VEqvajZIfOkaovHU3Gl3fYGgqco8pmfTWJStcl26lRQH3aD31gbjSx4RKq/WhEOoLGUab/Q2UIa22kt4+YG9LEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711313400; c=relaxed/simple;
	bh=1O2i+z9ec5worg89eWFtLCmRb7aXmuCsagcLEDtkmCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbDJCIw9Ek4HDu19dcqGn/vjuxkoSFTMerzyYTVixOcoe3OKKneNm0RWLJZxbZitzPB59BfKG7xXjERXQ5z4a5CvcndLWWSm4e649pqmuFM84HA5VStwO9QfqK0lkUL5BJ0lS2j0/08iZX2YiCeMTWAhgEA37huP2Y+XmCXr05A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIHUCz0r; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIHUCz0r"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e740fff1d8so2581743b3a.1;
        Sun, 24 Mar 2024 13:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711313394; x=1711918194; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3lnLG30Vz/3lGDQ/KrylGmjWUx6Db7eT1RcS7bbD5KE=;
        b=lIHUCz0rgyFhpxP/nPpS76WSO+PnuZq6mhhXwN7Ikw/j3XaTEV1d3GbiXKl9SrA2v+
         Cxtn+KmNWFp4HRi6R52Wg4SzRZ72O5l++YvVl5+wRstdESLkY3ECz4dh6hlqF8PdLFQi
         52qDTTKCSW76GVCPTpXT2fsB7vJgzSPbjnzl246I8Vfv2wOX3w2I5Nk9Jo5vhMLIQXDD
         J/mHGmxEgw+95QtmMR1hF+R+xwu/B7+DYIPuLYtr8Bc6qBcJO2DAC7Gh/xEnCLYpqva+
         zQcgKMv8oOJTlurrWnS/9+7ff1kR+K4D49FjwDaMy0I6ZWRqKDt0fvVXFaWwIpYa3zl+
         v3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711313394; x=1711918194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lnLG30Vz/3lGDQ/KrylGmjWUx6Db7eT1RcS7bbD5KE=;
        b=LL7mj/DQ8kf+98LpnQV5Nd3jVot6RYxb0AaCgrUVs9i/E50ege/KpxWrywWZnZDkbg
         YTlFuR44OD/lxvhHshr6RQE66JBs5wprL7yoCgIoBH7imj8RncmU2smlmyKql5jgfWJe
         qCuT8P7JEYY4yedJcNkYCzVsYqtNOUoE4eB3FddijQvRt4Uw8BEiKoqI9Gt9ygD8QCVF
         PvYTcq7X59adjem7Amu8eZMFJJLvGxk6EKyHfui2DDylz0vccupoxnMipNwVTc6mlz21
         LJQdG7dJBpK/GyKFSvSmlW6+CccYGobeNr3wScGJoijd7+xT4K6c/xeCC1N1HmCVMjnW
         TvAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1JdZq3fngyWYBt6iDmAaKrz3cNUXbCLvcxPUj8Z73Q9awawKq0qLAfbSPmqWfjVs64roP+At+mKYLbdmWMuUGuy6yB1pcv/Muvjbzxg==
X-Gm-Message-State: AOJu0Yz99TYzDUXxyk2g8Ruvj18csfXnLNPumHG5J5jHoEdUZXbEAEi1
	yf+05vPP5ltgSskbTpqLHdY4S0MRcQEDNsgB43E2Ta6kUnCVmnAI7ZPgWKQTugI=
X-Google-Smtp-Source: AGHT+IHLNE1psXO9z/vQGNfZSPapZDrgcXSfPVt5sguaQ7O8BUVBYq/u/3Dec0Gnxb8pCOiObp1lhQ==
X-Received: by 2002:aa7:88c6:0:b0:6ea:7f6e:f451 with SMTP id k6-20020aa788c6000000b006ea7f6ef451mr5543305pff.1.1711313394444;
        Sun, 24 Mar 2024 13:49:54 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id c6-20020aa781c6000000b006e7369736dasm3010066pfn.74.2024.03.24.13.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 13:49:54 -0700 (PDT)
Date: Mon, 25 Mar 2024 02:19:47 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v4 1/3] staging: rtl8712: rename backupPMKIDList to
 backup_PMKID_list
Message-ID: <5d3930cb847fd311afdd16c8fb947133ec49b55e.1710965653.git.ayushtiw0110@gmail.com>
References: <cover.1710965653.git.ayushtiw0110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1710965653.git.ayushtiw0110@gmail.com>
Message-ID: <20240324204947.sVdn1OVOby_ohdMQCqpTMqvk8oo_w31EuX2-P58Abs0@z>

Rename backupPMKIDList to backup_PMKID_list and remove extra spaces
between RT_PMKID_LIST and backupPMKIDList to address checkpatch
warnings and match the common kernel coding style.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---

v4: Update the changelog to match revision history
v3: Update memcpy() param to match new name backup_PMKID_list
v2: No changes. Just a patch sending error.

 drivers/staging/rtl8712/mlme_linux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8712/mlme_linux.c b/drivers/staging/rtl8712/mlme_linux.c
index b9f5104f3bf7..a009ec1a5c11 100644
--- a/drivers/staging/rtl8712/mlme_linux.c
+++ b/drivers/staging/rtl8712/mlme_linux.c
@@ -84,7 +84,7 @@ void r8712_os_indicate_connect(struct _adapter *adapter)
 	netif_carrier_on(adapter->pnetdev);
 }
 
-static struct RT_PMKID_LIST   backupPMKIDList[NUM_PMKID_CACHE];
+static struct RT_PMKID_LIST backup_PMKID_list[NUM_PMKID_CACHE];
 void r8712_os_indicate_disconnect(struct _adapter *adapter)
 {
 	u8 backupPMKIDIndex = 0;
@@ -99,7 +99,7 @@ void r8712_os_indicate_disconnect(struct _adapter *adapter)
 		 * disconnect with AP for 60 seconds.
 		 */
 
-		memcpy(&backupPMKIDList[0],
+		memcpy(&backup_PMKID_list[0],
 		       &adapter->securitypriv.PMKIDList[0],
 		       sizeof(struct RT_PMKID_LIST) * NUM_PMKID_CACHE);
 		backupPMKIDIndex = adapter->securitypriv.PMKIDIndex;
@@ -113,7 +113,7 @@ void r8712_os_indicate_disconnect(struct _adapter *adapter)
 		 * for the following connection.
 		 */
 		memcpy(&adapter->securitypriv.PMKIDList[0],
-		       &backupPMKIDList[0],
+		       &backup_PMKID_list[0],
 		       sizeof(struct RT_PMKID_LIST) * NUM_PMKID_CACHE);
 		adapter->securitypriv.PMKIDIndex = backupPMKIDIndex;
 		adapter->securitypriv.btkip_countermeasure =
-- 
2.40.1

