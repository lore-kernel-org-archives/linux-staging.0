Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441E01367;
	Fri,  1 Apr 2022 13:03:08 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id ke15so1916514qvb.11;
        Fri, 01 Apr 2022 06:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cuEZGYCDTIg4hAs18A6RZQYja/XtuoYHfBwjj8fnnZ0=;
        b=FnP/rNV7/WXimg+zgn3ZqWYzD72kkxZ/ONysifSpqL/1K7GEgH19xEywvc/NBFTB67
         /fR/Qc2j32gxCUahzaVZJ9DXaVZULmEjajoKBSjIa5Xd+pKVSaxeu+JgLGjDdJXPqRHP
         1C/h8SdDjkKTBqNEjYbYg/hnkBSlVZSPHtdzdgRLr3QS0czqcsXEuNs8p9mZ3Vjyu2eo
         lu2m4KQpjSUwls5Cp9s32l6HbNcuT6KdcGYRs3oEk2xosAk28ZaTlNAbRIYJmjJfBWZ0
         C/PUuBgVfsMTuMA51hheK8DvaccF7J47dgy4LTtQ9QS8ngwCa2kAENdsCOcaycTdfaoW
         rEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cuEZGYCDTIg4hAs18A6RZQYja/XtuoYHfBwjj8fnnZ0=;
        b=uxnaNuuHl0Z/9LCLtLPC1MBBzCht0za4qHqVDQqmIi6KysQmuh2GMCHpEUVb9udCnM
         tgj6tKMAWCZJ1aS8H4dtOYpD182s0lzWzpew+h4uXTItc46s1TgSrSM+ljymBnNSzdQQ
         /pWp+kVNYGTTlZvWrfJBstoIzlmtfVkYcuAnIj0e+Ifpjxo7nc19Okc43Xwq/B0kBm9m
         z2QFTgI4NrL1NlT4yoUuRrntKG7rvipNgRQQyAUblFdJL0aDuEArHgt4UX5j1n4fKkJg
         9ZiV0fBIVVfFiUrDwmZckbMtzUaW8Pa8wG05rWGNflhq/HCzzvXFFKvZK1KEHD6tIqj9
         n5ug==
X-Gm-Message-State: AOAM5320yu2AXXz9icZdLZlZUeSM9ZcemL9j9ka+iTK0tdZwYAlDjGTB
	hheUEZUYmdP9Xbt3hqqJFDc=
X-Google-Smtp-Source: ABdhPJxDLw2zhT+Jeb4LonUp4ejui9EfOEDSyMLbQER+MBQC28/Iq33mx1o7adfNF3glFSgma3LaEQ==
X-Received: by 2002:ad4:5dca:0:b0:441:6063:e235 with SMTP id m10-20020ad45dca000000b004416063e235mr7845530qvh.48.1648818186806;
        Fri, 01 Apr 2022 06:03:06 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id s13-20020a05620a0bcd00b0067afe7dd3ffsm1348581qki.49.2022.04.01.06.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 06:03:06 -0700 (PDT)
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Subject: [PATCH 0/3] rlt8723bs cleanup
Date: Fri,  1 Apr 2022 09:02:44 -0400
Message-Id: <cover.1648817213.git.sevinj.aghayeva@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches fix three categories of checkpatch warnings (redundant
braces, redundant else branches after return/break, and constant
placements on tests) in file rtw_mlme_ext.c, which is part of the
rtl8723bs driver. False positives, such as

if (foo) {
	/* TODO: ... */
}

were not altered.

Sevinj Aghayeva (3):
  staging: rtl8723bs: remove redundant braces in if statements
  staging: rtl8723bs: place constants on the right side of tests
  staging: rtl8723bs: remove redundant else branches

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 167 ++++++++----------
 1 file changed, 70 insertions(+), 97 deletions(-)

-- 
2.25.1

