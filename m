Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3837B3FC2
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 00:02:35 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id h13so12846636wrp.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 17:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/F6truudQkrd6D0yWmDRMgUxpMmDNonPusTihynd4Jg=;
        b=aP4rAV3OQGFz4akh4Cx+FUeaDVTA6Pns1s522jZk/bz5hdm73Br6VyaS9f/wTuYAUC
         uIvQCBBzEDF+1Wx2JeXDEYtQkumJZpAIGQlCMEdYh0263cAbtNbgTRQMjCzlTzcIXxx/
         O16zxfebDfux9dok3F7tcv1o1SbxiUHeETJPp6hV0ijdwXSz8Bw+/zq4VboWtOyd7k5c
         tYM9hzeSsTW7nXY29VTituBUgwv2F+2sRiiYha/otCg6U0914Ou1poNyD4NCZVioBQSe
         vxsC7Nje26KSvHrDW9Hf/Nu5qg+9wJOhUIONbte4MUa/gcYvIMOon8uX7BIaxc01EXq0
         cJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/F6truudQkrd6D0yWmDRMgUxpMmDNonPusTihynd4Jg=;
        b=kV13FXwiNaj97SMOrDzmBi2u1v9EH5AXNkkwaqcKa/uDqAgLqivJFhL7p5qokV1Fzq
         XXQnOJN08xKWIYt7nPWwc+D3fmUUP2w7iRYq5AUj9vrD5nN2gA4Dn1nFXzuP5lfJOxBB
         RHs0B+khQ+I/cU7u1ibsbPRvlt/Y6aSCNp8sm0rz/u/JWyF1wfVIH7MRcVTe75Zg2vUE
         AJi63ZJqCjiIR0C2BW3rpwRJROFj0W+GS+L+pu9BW0ir3Qd+UJMl1OS9jW7DUB06f7eJ
         ynXkYbTyivHAnNnHdtW4REvEuiePY3ZsJ1NlsT6ALHHqaBlDmRfN6az1gLk8zuqRghIh
         Q0oA==
X-Gm-Message-State: AOAM530XP5GWD56PCe2wVfdCcdpKes3j150Yy2JJk2qQ6vTFI793MyOw
	/FrJ4QtBqJzp3TjjgR1H20bUag==
X-Google-Smtp-Source: ABdhPJxRQlGRFsLYO4cEKlBl+QZhbr6u/rPLki7bE+YygdzqH7FnIVWKqgWdlRq6ntkiZzJE5HjFWQ==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr12964869wrp.381.1630108953617;
        Fri, 27 Aug 2021 17:02:33 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id h6sm7059657wmq.5.2021.08.27.17.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 17:02:32 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	paskripkin@gmail.com,
	fabioaiuto83@gmail.com,
	fmdefrancesco@gmail.com
Subject: [PATCH] staging: r8188eu: add extra TODO entries
Date: Sat, 28 Aug 2021 01:02:31 +0100
Message-Id: <20210828000231.1458-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add entry for CFG80211 to reflect that it is currently being worked on
and is a desirable feature to have for this driver. Leave entries for
LIB80211 and MAC80211 in case anyone else wishes to work on them - they
can always be removed later, but MAC80211 in particular would certainly
be good to aim for. Also, include an entry for improving error handling,
as this is another goal of the cleanup effort.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/TODO | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/r8188eu/TODO b/drivers/staging/r8188eu/TODO
index 98f918480990..ab9d5d145b3b 100644
--- a/drivers/staging/r8188eu/TODO
+++ b/drivers/staging/r8188eu/TODO
@@ -11,3 +11,6 @@ To-do list:
   the driver.
 * Switch to use LIB80211.
 * Switch to use MAC80211.
+* Switch to use CFG80211.
+* Improve the error handling of various functions, particularly those that use
+  existing kernel APIs.
-- 
2.31.1

