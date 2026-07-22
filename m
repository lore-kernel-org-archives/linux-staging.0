Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F3D388E4D
	for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 03:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784692699; cv=none; b=XzLBLleE7hi5fbz2GMhtw1PiiL4O/YkudjjWp1RQJ6AuNUclfqnRJUu/J4Bm4JrpRhvr41ymkiDxfvS4F4G9XniIwnrq+X5tiFD53LpgSBOuHcSVFu74ADiG1izU76dMmVGqPqIMRhFvdAXdJ0S9/tmvYEQC9S965NETqQbUhsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784692699; c=relaxed/simple;
	bh=Cte+u9tH8fCR/6ttNQaKQJ6a1hf+2lqW1U/FDUKfMcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVuiPsigLfi6N47LymCUC01qlX5mdvHD5LeGpj2j/Z7hc3/wuXgKH1GnAMXz2Q16hZyVCPiukogY5TQv3eHOEw+dF4bdk0alExAGO/NiX09Q96UJlFd3lSJTfWupbVTwHRCZEUT1qz3kbeyMAcYUs555psxkDTM9joTmgv0w3Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNla0gGW; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNla0gGW"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e4fd65b2bso675610585a.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 20:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784692697; x=1785297497; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jeICyQW2fPpNALJsCTGYlCb9AbcZZPQ0wg+u4yTtyc=;
        b=lNla0gGWyi03q/JZQ9mrQZfyM3y2X+agi1WZEc2reIdwkufy8DEsuANdJ+syNLvwfE
         IsABETqD0X2tRFNFevvq5Af0yifp5NzwHbLMsbs6XEhNL+nImYuhLAI4j6HftOtUEfWz
         Tow8a5/RgrF8+YnCRz4hWZgSCMAcN1IFaMYVaWBXU0Hx2HP1DYMDQhg117i1FhSeaZ0f
         qm2RjuqUYBkXqg70jHmATANcnmQuVniVHNc3iXUiFvoJtujWJfM1S+eShJIspXhDpEZj
         lnpYJFAKjw0UFmZvsdIgj2IBaVT/SZ+MapE1Faksp5MvrDa5xpdkSwGt90X5yvmALd9c
         Ktmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784692697; x=1785297497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jeICyQW2fPpNALJsCTGYlCb9AbcZZPQ0wg+u4yTtyc=;
        b=bkXGgLOcgs5NeTPrrAp3H8yDhfQk/WhlFyVBhDlVpD3zDgPEQEzvrYEG+6OA1uA11N
         bxud/IN+jZdi3EiggIRQZ62ejQD7TQSlzwsNTMYEVJIxw3IiWmRy88Fl9CR3JTfgUsre
         8W3GNVXdG2wgvSn48cBP3mN/g9QvdzFLdbtq1/2WUg34nhfmbhysGFl/Cz5IiBEBF/aI
         Ec2WJMDOiVOfSrUYI6f7syOZEl0EV196UeY0ja4YClMmU4DSp9YZ+CQDPMaO5d9ipJLc
         ZN9ktefOdYo6jhAk6/sWPE9/Jrr5jhQ+fadw0ZDmMxtqKdc6IKj6iDMkUU96NH56iqlt
         MLbA==
X-Forwarded-Encrypted: i=1; AHgh+Rpb/KIGpv1VWa8MTXuxWeDGZhyXU9iJZn6PVnMftduAqBGYPX8sNAaWyuNAlZ502xlbUcTxHQnosnQQalUE@lists.linux.dev
X-Gm-Message-State: AOJu0YzW9XA6fkkaft0zkS773Eh8DaMPAS3NLjF9A3epqCVBvO+uy4OV
	J4jnfjB9AMvWKwxMM4f12UHCDHB/gYA6g0RZOCRYGH6yQoSfLVkrlCKI
X-Gm-Gg: AR+sD10JeMwAuYUGRtgvNnk1EGxPQgLzDjATIK+azt0O1lRNytPcu2PIo8VSSVmkGi9
	in//IOYzyRf1/jrn+I1CjwBlGqOXGEJOImpLg7Au/wf1HX7BNuKhDN+ypIRHKuNoqMzYNNeaabU
	dOi1bFeZNZ5lXcdMQx+d5AdvBBHYYcvKfXI/ib0Ys8QkPWpigPzL3iAW4sDYA0nYAVY7GLs1Bb3
	QsxFYb2JRuBHUP+Qt/RcFl1oEvLFQJAz0tgfnpimkZw5XEGij9+NneVfvW+EHCkIMHx0OCX6YHf
	GzO5FzZWgfuDmoQFbjiNtKzESSyzctX7Mipw9wM/T+ZjnCmEhCFP6dlBA1texHD4mpvGccjaCMU
	uTTumNuBxrJScwlYk7k3imSUmccz789rSJbl/3ElzcVwITcQZLvYzegQYpzUZVTM7u7/h5Ovgdp
	O0LXSvjxGbW4G8q13Ld46Sls6cos/QQ0niu4PVHPON2K3vLtOsfSZCpA==
X-Received: by 2002:a05:620a:1a1b:b0:92e:cd21:447c with SMTP id af79cd13be357-930b3f3e243mr2072924785a.38.1784692696928;
        Tue, 21 Jul 2026 20:58:16 -0700 (PDT)
Received: from thinker (syn-072-043-128-189.biz.spectrum.com. [72.43.128.189])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f68c67d6sm65916085a.17.2026.07.21.20.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 20:58:16 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: airlied@gmail.com,
	andy@kernel.org,
	azuddinadam@gmail.com,
	chintanlike@gmail.com,
	conor+dt@kernel.org,
	deller@gmx.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	gregkh@linuxfoundation.org,
	javierm@redhat.com,
	krzk+dt@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v3 3/3] drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
Date: Wed, 22 Jul 2026 06:57:31 +0300
Message-ID: <20260722035734.14981-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <alil0p_s9-dM9j_t@ashevche-desk.local>
References: 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

>>  	{ "ssd1327", SSD1327_ID },
>>  	/* ssd133x family */
>>  	{ "ssd1331", SSD1331_ID },
>> +	/* ssd135x family */
>> +	{ "ssd1351", SSD1351_ID },
>>  	{ /* sentinel */ }
>
> To avoid conflicts it's better to convert this ID table to use C99 initialisers
> (so Uwe will be happy).

No problem, adding a designated patch to v4.

-- 
Thanks,
Amit
