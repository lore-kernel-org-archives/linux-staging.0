Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A462D97AB
	for <linux-staging@lists.linux.dev>; Thu, 24 Jul 2025 17:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753377642; cv=none; b=Lyk6TjbwOEj8qdOeJl+/dew+RFv5h/0uixIDo1zCMF4CScnrVT5cwV07CrU9VKfjIIQ5DoWIa/QEnKgWGcZ3coEly+tpa8tojU7DvjKgUJt+d6dohrWjh1LFZ0wlROL8bc+Jal0m0z29VkeERZmFo/aV18+77rheP3z68ZJ3U9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753377642; c=relaxed/simple;
	bh=JjdIyqho2L1pdY174b2WWL7+9YNKkEJOJ0h/Daqbh7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WfKQ2/DguKpzKqvQ7nByWOmm2cFBDoq/Em9fbl60hz8E2zcVCvwD8CG2iYwmSArNC/Prsgws7e7kscGpgtLNGZ87NWnuSR5mDt1mFTeKsYsj9FWxUZgtg3HrLPr2nCPSTOPVJ4I+nuoOgNMaK8uMuyI2PSbGSqTYZWey5hbdvwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGI1Koub; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGI1Koub"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso2163356a12.0
        for <linux-staging@lists.linux.dev>; Thu, 24 Jul 2025 10:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753377639; x=1753982439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjdIyqho2L1pdY174b2WWL7+9YNKkEJOJ0h/Daqbh7k=;
        b=NGI1Koubr9ItcgMP47GEQJlicMeAUiNESnWzlNf6sgB5bCqKip1AMnEcprGpMGN7Yg
         vrH4xwsXASwRxONoMs2lKl0wQxTyO4Ch1SnuR4dKOodih4VNB3JqOPyKdCRPWD+Q7vSK
         71rFU7HZs/XUUst5V08OpWvV+kzooKFucsSHIsWyOljQ3DxvC9t9BOOgGBOV6oOu7pma
         xfx/yfDuuBYZ3eEXK5qahXP+Ffk17YcFs11OVXxdyYwGr4qmGgCoB2d9eCz1BNRQa7Pu
         nUTgg7X0MwAlQU0MrYxd3EwHCvSmuOOBhXa6dHUiKm/zke+eLPgJZVJR/yNE3TFKvlzk
         fHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753377639; x=1753982439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JjdIyqho2L1pdY174b2WWL7+9YNKkEJOJ0h/Daqbh7k=;
        b=bRYdRs+hIOYduPWiPrldaR4M06m9Gx1Iqn+rF6go89ie42oCkvjDFhx9a0yt67dkJI
         VxV75ydtb86oceY2dunj+U7l+D5lXf9gJxP3VQa8DCsGDw20e2Y5PVxfwRI71QLJw1HK
         JhD0QPbmYCUZuWlN1EJCqY7f3RFLAkB8s+ooYCvS6iwnFTGOMAoSnqgQpufje2c8Fd23
         TXaDCNdCsIrfemSsKMtoV8KHFa7/QtLX7TFBTNpmJS8gj2QkNIFmTFekDRo4QLByZx9/
         BLT6LGIcwrEXY1nqSX4E5MrWziv8cAAHwZxvpGRNzboPBiAiJd8UfIxguh2/LWTzMYgO
         3RAA==
X-Gm-Message-State: AOJu0Yz1sxNGriN6lfJn4U2fYzjov4qmW7T4HFDujyBdbdo9oHi/9jDR
	WkmQaYs3aMyZyzjzBGpRKHv72XTrQGUGLy6Lsa68yCdzvl5SbSPjVskd
X-Gm-Gg: ASbGncvh6Hg14qAVbutWKYCPrkwexZbk+jJsWbZi3u2v5j+Z7qtV0ZTwBAXH/yzWDLX
	tul5q/liMRt49KQ8L356iqp8DlyhhLd2/wWLy9mmsnxrqfYQiX23hANgeKB9tTjoTN0UnfyDf8s
	zsambcnGaSnf1SZaybJqTd8aFctCKIxrbK0bdqVMfn98gyzCTqstn9NcvsogMSxFc3CPeeHsq4J
	uauxOLO9nzsShCeIDDUWFqdX+I59WElF4mMLd1C0lLaQryCIPdNcwZ0PRNguhFI/N2Cxa3N1NsW
	z6IVRj7KIXja+6FOQ0avmyh42egfyql8ttGWM84Trq/stbF+V4+OPsjslFL+nd3w8scu200fl9V
	v3rpL7DElAqox2WL2c5cQZ/XN3CHJBLH5w0iIWM5tqMk7xl795OuOziwfYCEpH4wYWEoj5Qo=
X-Google-Smtp-Source: AGHT+IG/I/3kuH0MZeGbxqTluMGA0auO0pu9OlYfyOh5h6egxRVqvJCnVFafA2Q77VjQxho1xSTtqQ==
X-Received: by 2002:a17:907:9629:b0:ae6:fa02:888d with SMTP id a640c23a62f3a-af2f9381e96mr794874066b.53.1753377638775;
        Thu, 24 Jul 2025 10:20:38 -0700 (PDT)
Received: from PC01.localdomain (094190205166.static.ipv4.heldenvannu.net. [94.190.205.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47ff42b60sm134341466b.132.2025.07.24.10.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 10:20:38 -0700 (PDT)
From: Bruce Qin <bqn9090@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bqn9090@gmail.com
Subject: 
Date: Thu, 24 Jul 2025 19:17:13 +0200
Message-ID: <20250724172034.44679-1-bqn9090@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025072409-promoter-shame-8105@gregkh>
References: <2025072409-promoter-shame-8105@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Hi Greg,

Thank you for reviewing my patch and pointing out the issue with the closing parenthesis.

You're absolutely right — the ')' should not be on its own line. I've corrected it as suggested and am resending the patch as v2.

I really appreciate your time and feedback. It means a lot to me as a new contributor. Thank you for helping keep the codebase clean and consistent.

Best regards,
Bruce Qin

Changes since v1:
- Moved closing ')' to the end of the last expression line (as suggested by the maintainer)
