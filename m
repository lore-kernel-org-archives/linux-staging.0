Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2A0151992;
	Wed,  2 Apr 2025 17:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743614219; cv=none; b=Q+aYI2dv4m8WQRM8isk8iOGWMOinWzaClt/JB44GUL4UjB168MaeHuBLG/KUHpGQSEquNIkh6cyvXFUoydGLhjSnCKn6U1P6pWx5BfKncSFYHz+xZX0QDWQYysNUDNHm62BFiK92g610Yb+m5YMsSP0On+Kh8QLWV94//lUjD7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743614219; c=relaxed/simple;
	bh=ntBQ8YBvSjxLwm6joLtcDBsfy6hb3/+gK5Roub93e4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aZpDCextkfX0hYDzNtRFcbpMRS2Url+ozDOjEfyzsEEDF0t7pX3+OdULYfa14wSpya//1e9hqRnjG1QDyK2L1kQ6/OdEw4dbXSLGHH3N0wGsh1uRlo+m8//P6NCHI6P+YSGzpmtAZz/SJPFldKgYT4h96du3VFxF4lZHbfH0+R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsPhHd9+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsPhHd9+"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so38951f8f.1;
        Wed, 02 Apr 2025 10:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743614215; x=1744219015; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cinhPzEEhT1QyE/PG6mMyrF5hiwNrz0gNjdnK2D6mos=;
        b=EsPhHd9+ELORXx6m8NSwcWIdBbmCQEHWdHlp4vTawnM/2/+HN2sw2Y/P/RrTEqr02U
         Jqa8JN4vdTxYn2MhAYHhT1lVZ9DndgE1lBi1cE/G9d7s6qi0F4MSvHP2sefe4XTjBlVt
         8QTsOazhZXcfCr9wkJuw7z6X91ZwzvCWr21bgzAwSnldqp969LZMjBipH1GxjY0zPQ16
         pKa3d5PjpJk9DHJtIt+MamH8Y4NJOucar+A688TWUTAIfjNaeBb38kA4raNhh9eQZzmh
         5tFCWOOwPSV6lRvHKj8Y0+7yhf+zUiCW8+WLF2KNQpB1OOEKakyfFHtbIZrNsI8eAjSy
         kRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743614215; x=1744219015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cinhPzEEhT1QyE/PG6mMyrF5hiwNrz0gNjdnK2D6mos=;
        b=sDwliN7x2ZtrNTPN8xKxnD+A9UjKdamx5mNkk24o1/YZ83TOhLtoS8VlRTEV9Ik4cp
         lmwo0rnsEdTsGvF6nAqMtQ8VwFDVoArUX5cBTA5ulGFzwxIyjBlfJaJcaInRWbYxNOTT
         u/ApjHLrC5G16ilRv1GondajAWdevfSuUeq0Qi6vq3T13Jt0QQkTCDQlwItRyCL2Ch3b
         UjvAbHUBC0k08jlEsdybIrbnjJDb96MeeisX9AHYy3gKMSJ8PLpOR4RtPnshZ6kcOBug
         yW8H6D9YOqdioqM9a51i527/7bcpO7gk7c9rmChKiSaTXV8GnWzUUp9wSwLyQ8tHfOWw
         PR/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOTL4xzS30hUGlgLUPtTiOFitgUvpWN1POWpwY0tIN9nMMsIwYFE8KOTjse+Yn9YeW9jFYdecSjfx3uIgf@lists.linux.dev, AJvYcCWJqmDP+yY+zGCOO4NG1RoR4XlFcuX5rIMren5npgB7oJHFuhBGNmMsC6AfFZ39hurqwAQVzjI2q/Kw@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx0iOREMSCFdkuwu0TCWbazy8N1YZfcYLHYbBFD3U3PYBT6cvq
	9YtOgGk2kzi7B7boWe2qDPVJBLKFRwQj8VF6EMhmKNB+0nqblxxl4NlpHCIOxf8=
X-Gm-Gg: ASbGncv+ey3rDk4YVCwTcVHT6/Fq7+FAo9C37CYpsyH0bLQLHfpHt7QvhdMGB579exv
	Ojh8Mrlq1DVhCwnwyY/rHRAWD+55OuTUUjWxLWvijSmg/OygxodU1v4oVbYhORkH6qukJt+o0MO
	vPFGuoGw8CMn9LVYq/Aje3qWBKCwFri18nbQyzEdKvrlRIIKWeA7o2JDFFu5VR6D5BdglR2rxdf
	y0Cykc8XuRjHcrzW28Q2Xj0r4/9HBpds6B10ib5pTr9fBMIhvmnzmWGw2w+544rRbBiGkon2edH
	7cYWKPR6bMdkVVmaIH/rnXJfXvmlHupE28bwq0YtOA==
X-Google-Smtp-Source: AGHT+IEpLy1hDYk9qW38z4NQPL1UllYS9vbREvFMYRYe5cpT/xjNBknLy66id3POist2gvbNiC7GXA==
X-Received: by 2002:a05:6000:4210:b0:391:481a:5e75 with SMTP id ffacd0b85a97d-39c29752ecbmr2577538f8f.22.1743614214910;
        Wed, 02 Apr 2025 10:16:54 -0700 (PDT)
Received: from pc.. ([197.232.62.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fcd489sm26713525e9.11.2025.04.02.10.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:16:54 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] staging: rtl8723bs: Code cleanup patches
Date: Wed,  2 Apr 2025 20:16:41 +0300
Message-ID: <cover.1743613025.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset refactors the rtl8723bs driver by replacing
integer literals (1 and 0) with true and false in instances where
values are already defined with true or false but some defination
contains (1 or 0)

Changes in v2:
	- [PATCH 1/3]: Rename the subject line and improve on the subject
	  body
	- [PATCH 2/3]: Rename the subject line and improve on the subject
	  body
	- [PATCH 3/3]: Rename the subject line and improve in the
	  subject body
improving code readability and consistency with standard kernel practices.
The transformation was performed using Coccinelle.

below is the coccinelle script used:
@initialize:ocaml@
@@

let same_function p q =
  (List.hd p).Coccilib.current_element = (List.hd q).Coccilib.current_element

@r@
expression e;
position p;
symbol true,false;
@@

e =@p \(true\|false\)

@@
expression r.e;
position q : script:ocaml(r.p) { same_function p q };
@@

e =@q
(
- 1
+ true
|
- 0
+ false
)

@s@
type T;
T e;
identifier fld;
symbol true,false;
@@

e.fld = \(true\|false\)

@@
type s.T;
T e;
identifier s.fld;
@@

e.fld =
(
- 1
+ true
|
- 0
+ false
)

Erick Karanja (3):
  staging: rtl8723bs: Modify struct rx_pkt_attrib attribute bdecrypted
  staging: rtl8723bs: Modify struct sta_info attribute qos_option
  staging: rtl8723bs: Modify struct sta_info attribute qos_option and
    ieee8021x_blocked

 drivers/staging/rtl8723bs/core/rtw_ap.c       | 12 ++++++------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.43.0

