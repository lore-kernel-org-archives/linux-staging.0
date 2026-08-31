Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5D233345A
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 13:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181966; cv=pass; b=o4oWqfulvV5RrYpeNnVW7//IXPIohMUARA+qoA90ANO0c8jVLaIao6cf4rmVzp805l/YGS6dA1gPi5qKTbfRqN+31IZHc2Xh0QhLdECoHDxj7PrGuOHPOwYi11Pzk3cWwWH/oH+AtMcSmJ1WBhT2x7OKUYcGqrp7O+BNLbjXGJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181966; c=relaxed/simple;
	bh=HysHiL2VRlqM9yAPSNQNOM34G5A/mOcb8+1e4IfygkQ=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlEALddmd9NekRfDA5dmox9totawaNpejfEZBmLxNMOstkfIXn/gO5vgj+UmfIfgCb454m8CQdKiJ9yWRh5gnxoyEI3J/aAl4WglT3rvXtHZv+WF3U3V8sEB+IWcoXhtNR9PgU+FOB4Y+noFnomvgCZXDVH4mt7vU0YnPgmJp7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSExnJg4; arc=pass smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSExnJg4"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6b0496f4bbcso1248022eaf.0
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 06:12:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788181964; cv=none;
        d=google.com; s=arc-20260327;
        b=DI9/p56xRQTWRqXK4DCNHbm8n2R6ok2strGHYOjWjDLFVAGBFnI872FCjQp/LH31r7
         aL2B8+eDMUBbBP1r+iyHoZ3YoXyYmH/mNJX+exjZoYkOXpLxiHHd7tJuiP3pqLwmD2rp
         21aIfQpUtoEZjiwMKnHexm+U6WWsiUmQjfIWGPsstltHNKGXfSW9QwjlCN7se/rLqR5J
         q7EFvbyqKGhiXLs7QMkgTukWbqR21Jtnt4jSeAzaf5T4YLI0cGJ9K+JcHrh0YwPeF73B
         g7H8rY7q1YkvBEYPsYAyQZxfldco8bYdeRajJpSnnO30VYdTv++P9WmIVOUrbnv8NQvr
         +CFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=6dwdlMhiwvvGNP0Nbpo0VofOYlqAm52W9bR3+mOccsk=;
        fh=PiDrwK1rY6tD26IbF16yVcrGe6MtOrTldGhJp4v4XF0=;
        b=QuxltfPUZrK+E95dNnmr4zS3E8s2d5oGS+/6qxq1oN1+9b7RKl9N0EhGM+fIUaZ2h2
         kQrY9OJNIl3NobGsYjfPkhuzyvC1BAVLtxHd1HhxJ/Ha+gKje6E73IAKZImNfSU4nwO2
         PcnleGZENz3CyN68im4EwnB0WAX0vtXLlx8frUs6OLPQHRLFEQmBm5JQ5Gvi+edV9oxU
         XamTOrMsbC4e3PFpgiUhvF7aIX7LDMObHo9MlHcmZ1OFLSJwDaxU7+aLlMp7S8zPJZQA
         kYJZuZN9w/VGQzJhSiGojeU+nQlxEWzQd/n3yxFRBGXlN27QfCE0IAbBs6V2Y3mEv4zy
         lSFQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788181964; x=1788786764; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dwdlMhiwvvGNP0Nbpo0VofOYlqAm52W9bR3+mOccsk=;
        b=mSExnJg4LorA9iDsfrIk5AyIQakU7d1DmJzOeEXILwQ4N9B3Ooe5jrQ5w8QaeCOZFv
         vtwqKdNNbwj3m9wmbNzJLbVH+oqmv/pzR/mrIKwtzrB5Bh1IF6ms0oazFAsewTlbip/x
         Hh9n6VcdSH975obLdeHeldbpLH7LheLIOSvawzc3/BRHc5f3XMo3M4s22YAJB30kwj/j
         ZFQ05uN6B36gfM5Wi/KSYh30JKUlhaYnPOc5pIyABCQZz7OPb4sbPscXElAOTFnI4nNq
         Lc1CixuWYbuM2+nZgP7ZKHBYieo5dbtoRQnCIeJm9j3z8mhyJVKb4SIXy8ydXeIeMHpL
         2M3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181964; x=1788786764;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6dwdlMhiwvvGNP0Nbpo0VofOYlqAm52W9bR3+mOccsk=;
        b=p8CjWgql4ZHzVa2VAdNZWXkRrKGEv5/3TtBuw5jQzDpR65lAqxLNpv6rYebnvo6jDP
         g7FrCbIoOZI1hyFcprsDfZlUM9sKCg+ikuVljh46sO869qygCf39OUzf2qqjLKqvXBBr
         gj4c0KGgqTzMXQknQTef4IUsmA4VHWD1d72YoUii/ONusBHe9h6cPI8+yiN+rw3QfAGI
         E0oGAIIPIxswxm/NnToAMZ5HgiBOZ4iWG4XkXMf5Yu9A0FlxKpx+8t08kIc+lN3uEeJm
         8/f2qRXZQPH9abRtR1GyKz43KbukcIhmtrIlfyjYanFz4Y4BHdJAg99UBFRibgR4pv7d
         cHkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzC+ohLc/oFucXQ4UvY36gYar4JAuRTiLE7vHTLTl5XgXObAC5RVAFKf1JspmIOOlLjQpSxXxB0c2Aahr7@lists.linux.dev
X-Gm-Message-State: AFuF++lqsiaT1LOMUkmLrH06JcjdfvmHSkw9qLik/7qXtLFis6f84lsp
	SjcfTC8xBzhx5x8x5HAKBblHQwOX+vP3V2eDRqiMBHISoXhsj2D0dMjIygCurlZ4FKMrFcZE8t4
	joUoCRdp9R/bdQCrXkIkdnY+FjNy4FNk=
X-Gm-Gg: AR+sD136/aTOGoa/Tnq/g9X0V8xWLUkJBKK+qZ0HEMo+KzwitnMZnhXKeaBdkmpkxhV
	ReAEVSC66N1A0fweJkOB98SFbyGNpNGHKSiPg187gupHVq1HDplk0+xgcFytzY313ynhKJZIfa2
	kkij/3G0owMT4J41eagP23rvruHq4tqC/N5Zkx7wFFDTdf6FHdgqemOI3p81CzwoRNxBy5SfOyn
	0WY0idYyEe3IiTHSLYFEYP68IT4aBx4TVmrGYrUiFoGix0yKMYldBMBtkxODUgJ6QjN1AaRVunP
	jeBWhhYD3RDapCBIUO/XOQ1JRIf3YFuMkuR1xIMm/RgxFUuTmMZFy0nkaOdZwby3QJWFpjwXGGF
	Qb8nJ4jGLSh8EPO4n+R5cTps=
X-Received: by 2002:a05:6820:824:b0:6b3:6bc7:2ea7 with SMTP id
 006d021491bc7-6b36bc73476mr2621340eaf.7.1788181962932; Mon, 31 Aug 2026
 06:12:42 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 31 Aug 2026 13:12:41 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 31 Aug 2026 12:56:57 +0000
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <apVMALyPsJSsB5BR@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <fb26c4cb3dae5d87ee877dd558d6ea5e0b3926fd.1787933456.git.mauriziocasciano7@gmail.com>
 <apVMALyPsJSsB5BR@ashevche-desk.local>
Date: Mon, 31 Aug 2026 13:12:41 +0000
X-Gm-Features: AcwNN1WESpYlXZuMNQwNmJqDlEN047cygLvkqCI7j1Rkc7gQt6d8EHm-v8YRiv0
Message-ID: <CAO7O_xja+1XutiXhXUZ8k6+cF=P33htUVjxKZ1ELWR1brb4knQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] media: ov8858: Add INT3477 ACPI ID
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jose Maria Martin <jmmartinf@hotmail.com>, 
	Uwe Kleine-Koenig <ukleinek@kernel.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy, Sakari,

Thank you. The use of ACPI_PTR() in v4 was intentional and followed
Sakari's explicit request in the v2 review:

  "Please use ACPI_PTR() for this one."

That review also referred to:

  https://lore.kernel.org/linux-media/20260828084328.257703-1-sakari.ailus@linux.intel.com/T/#t

Andy subsequently noted that the last patch in that related series was
controversial and had been NAKed. I should have called out this conflict
explicitly when sending v4 instead of leaving the rationale undocumented.

For v5 I have retained ACPI_PTR() for now. Removing it unilaterally would
discard an explicit media-maintainer request, while keeping it without
clarification would ignore Andy's objection and would not earn his review
tag.

Could you please confirm which form you want for v5 while the related
ACPI_PTR() work is unresolved?

  .acpi_match_table = ACPI_PTR(ov8858_acpi_match),

or:

  .acpi_match_table = ov8858_acpi_match,

I will use the agreed form and will not send v5 until this point is
settled.

With Best Regards,
Maurizio Casciano
