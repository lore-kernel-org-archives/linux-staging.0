Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6DF173
	for <linux-staging@lists.linux.dev>; Mon, 19 Jul 2021 17:11:37 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d12so17057097pfj.2
        for <linux-staging@lists.linux.dev>; Mon, 19 Jul 2021 10:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=yoa729tPsnyOV1Y+/5ZmtExrLCgEeGDbIFxlft1dfP8=;
        b=QsPrkgoQZMDKYcBF+idNxxDG9xBLy7hZCC0MamSxk/W+9pPssNZAD8LPNhy3wwrDPT
         jlXoAFghpUhqFhujWoH5ZlyrnZqHrrW65Ob7O+p81QUnpj4wfJLaXKbBH39HThZrBonD
         W0bEBhUZichBFp55juMbk77DalmBW0eku7VBgGJKMO2Xkh3IvXEm1B+3mgwIEeHH4D/E
         V8O9DWC4cvwzkDwzgADKoRYA4YYcSVkh+/yMBjHqGjCEqvf/QWy+bTYkess9wxlgFSwx
         f3WC1BMjjUkhNVsAnfnhoiW0HleLEhuLNqignYnr9DJxCUB/20LSbeA8QKT+VlZ2ZMSp
         KwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=yoa729tPsnyOV1Y+/5ZmtExrLCgEeGDbIFxlft1dfP8=;
        b=BXs7bjI4dOAlzhzaau20ccunBJcxncbzoW8W800GVSFHTWyb2XIrX5qhi6woile+BP
         qFnTZ+6blhj6/PEXgzRk7RXPA94lCGKTI459TdOLhWxMgobJEvwG0jRmEX5QQBp8IrAc
         ng0/soY+RO7UqR6fZpwuyRhtNP0TIl0oxhBL7AZeVjaf0WQEP9IAMOtd73p2zrae2xcq
         QWkQRd8niaLDKJJocMdxQ8Szz2Rti3SSwe3UZZ27W200szBC1x6slqbRwxDtJEChL4HY
         Ty1DAeihWFsOYN8VNKmYjfj+BshLt9qf5RIJambZttFgSj1jTmpyTK3qJIKlJWolnI/N
         iUqQ==
X-Gm-Message-State: AOAM53062atib9phsOEMJPJdRIeROx7JW+5ME6wynCTuf4sJ/hO4S5pu
	dsi+GLQHY0sSn/KWHUg+Rbg=
X-Google-Smtp-Source: ABdhPJwtbRKJMGkmz7/uzgxegd8blnKQmJYwOJ7nwsf7kaEYmZx/UjM+NrdIcC3aysN4zSUwtmksvg==
X-Received: by 2002:a65:44ca:: with SMTP id g10mr25982370pgs.246.1626714697347;
        Mon, 19 Jul 2021 10:11:37 -0700 (PDT)
Received: from ojas ([122.161.50.29])
        by smtp.gmail.com with ESMTPSA id g5sm440882pfj.212.2021.07.19.10.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 10:11:37 -0700 (PDT)
Date: Mon, 19 Jul 2021 22:41:25 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Requesting suggestions getting started with staging/media/atomisp
 driver
Message-ID: <20210719170844.GA73837@ojas>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone,

I was going through the TODO for atomisp driver to look for a task I
could pick up. I'm relatively new here and task 3 looked decent to get
started with (convert PMIC to pm_runtime*). However, checking the recent
commits, it seems like there is some ongoing work on it. 

Hence, just reaching out to confirm the same and for some suggestions on
a good first task I could work on?  Thank you in advance! 

Regards,
Ojaswin
