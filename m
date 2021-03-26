Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB4370
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:49:23 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id k8so5020494wrc.3
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=elCWYfz7VHa4szRLmbcmnwRFKSwIKNOzpwn47h2LXJM=;
        b=T/oBWEa24zAqHxWOngHIS0uy21UYpOdPRjJP/msfpLHJqR4Y3lyVDwXoKkLLcgshMj
         rr+SsLD90/uv3zVCt53I6O8USKWLZPq0MAELtUHmJtNzXfbIP9gawUH4fvM8YBfBVTFh
         1YbwPKjrVJ31CWdurgl3bqMby/dOL5p7O0OAGKPubAvr0HZVQujFRsBDdFJgL8g3K2br
         nfRllSBnhpKlSjv6B653HdxcnCT30pYC8v0vPkd3wS2uuVfq2W8pP2iFIK3nzdZ+mY/u
         P+LKZZoEM/I1bthyOsXJy1rXOG+h9f0jQCUasIOa8RCSp3cTeBzuIvSFoxVY1RhNg0Yg
         pMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=elCWYfz7VHa4szRLmbcmnwRFKSwIKNOzpwn47h2LXJM=;
        b=AIk1OFAB2YAZTX1o1BkIbeKn5OdiI4xMYQFH9BinE7ReNgKL/mfVfYKuvEEsRjvxzu
         9w34feuTKyyzCcs10v8P0OnRpUpnZexSXm6eLsFCdvu9myLbq7ouODz9EM8xsMIBgGnv
         bMqn5mwi+9/qbXRh9f2pgnhSKc2USAGwIrFgw/wJO0tzIh+I4hgmrGxLVFXSy24ugsGJ
         SmJHKNI4DWXV+Lp7J7MnVoDYy9NweQZhIPG7qVq0siEaswpQH9jxfDt0BeJYOUPdC/mC
         GMdp1cSL0CyFsPP6H6BUzulYnaBLRjWmzn9N3s+ahJj1+MWnDJx9DQccs0Id65YBQylf
         GPTQ==
X-Gm-Message-State: AOAM530qGXSq+3UEYKdRwVpCdY2KqNrNuDo57fiEAv/VwPLDxC+QVVI5
	Zqa3HxRS0YO04jfAfL5HI6A=
X-Google-Smtp-Source: ABdhPJxONXoJi6pBhZ5DofYJSSUcXRLK7XgqLFIFqAOEhbdNasVBLoUAyvfuO3IWOyAk243WmhgOYw==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr14125444wrw.247.1616752161895;
        Fri, 26 Mar 2021 02:49:21 -0700 (PDT)
Received: from lorien (home.raoult.com. [78.214.78.108])
        by smtp.gmail.com with ESMTPSA id o2sm10237253wmc.23.2021.03.26.02.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:49:21 -0700 (PDT)
Received: by lorien (Postfix, from userid 1000)
	id C68321402FD; Fri, 26 Mar 2021 10:49:19 +0100 (CET)
From: Bruno Raoult <braoult@gmail.com>
To: gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	zhaoxiao@uniontech.com,
	dan.carpenter@oracle.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruno Raoult <braoult@gmail.com>
Subject: [PATCH 0/5] staging: r8192U_wx.c: multiple style fixes
Date: Fri, 26 Mar 2021 10:48:30 +0100
Message-Id: <cover.1616748922.git.braoult@gmail.com>
X-Mailer: git-send-email 2.27.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These 5 patches fix different issues reported by checkpatch.pl on
drivers/staging/r8192U/r8192U_wx.c :

Bruno Raoult (5):
  r8192U_wx.c: style: alignment with open parenthesis
  r8192U_wx.c: style: spaces preferred around operators
  r8192U_wx.c: style: braces all arms of statement
  r8192U_wx.c: style: Unnecessary parentheses around expr
  r8192U_wx.c: style: avoid multiple blank lines

 drivers/staging/rtl8192u/r8192U_wx.c | 139 +++++++++++++--------------
 1 file changed, 69 insertions(+), 70 deletions(-)

Note: One checkpatch report about style remains in r8192U_wx.c after
applying these patches, to be fixed (?) in another patch.

--
2.27.0
