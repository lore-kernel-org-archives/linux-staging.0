Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968D41E0E00
	for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 18:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751048303; cv=none; b=Bw7C+5Mx1pAeYLxLmqlIw/ti+vllVSNbosMYc9nAQETUwGW70L6eD4DoZEZZSMAVJXDlm2Wd2E3iUDEA6HCJmyRjIAXwLDar/1tsWAMrhe4aT+X1rriLTHjQTY0fAypriKnxKUrk2XB8+B6UQAJnRWrNNqEiWn0gnjh8EgNFSY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751048303; c=relaxed/simple;
	bh=KnagyrEME31deL6Qm0/gI5QVFeXMRzRv0VC11XZU6DM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdt6QWW//uEqCeHWw6p9pdOoInL4yqMDU/ADpJOHBzresC7BFpONozhHGm2cHEhG55LWHu5i//x0BEBlgYFG25sHw6E/mVnoje1bkJ8MIa/l6XEaADBpV94vKGb+zT9u0QXIerY/6qXWdNtaO4k08QlLwQe/MIxCcghd29Ikh5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D4QHdI2h; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D4QHdI2h"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-73afbe149afso105434a34.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 11:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751048300; x=1751653100; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RFQ6dvglvO57dmQMqJ9TjNqvSIg15aNiE+cHR4uuLHU=;
        b=D4QHdI2h/VUiApD1rw17tgf+eL2kBl8SPiCQc9bcJiGSPsxdlqQGCoAtBKXJvBJbSo
         u5NiJgUMV+xs1brMr4MqErQQsh0Az7RNItYLjAUozAWcTsZ9TjY2zm2PDYKCRFti6DEd
         DQWqE9g/sseYg5uy6XBjKPS+HOPCxjXKlQtXBfZj/yBeDzyHeVtrewZTGibqx58BV+5z
         JSM+2zK1uruXXHvLJdhfWhenZbvLnCdBsLzqevfor6NH/DGt9PFCj4khNitYSJyupOSv
         L2XAf6aBUaXj64M4Knwj3Aj/JBWBEqsAk9bil9Vn2f9lWIF0G3nF7OWkzeEissaWHi9g
         iPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751048300; x=1751653100;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RFQ6dvglvO57dmQMqJ9TjNqvSIg15aNiE+cHR4uuLHU=;
        b=UJCUhrZCFo27embdje/8S0lShcN5LbvJ+7UNP+gKWkyd+e7HI38kzXBPV4FJK78Qv4
         nEj45TPjHTlIF5ehT1smXa/KEKaUXphpxBOJr3QqrlzvOEwHKzSFu+A6FpX1a7uPMt8C
         B3zIoimfdRIpVLBMpg36fCMFwaYR3HENFe/T2WlC5hveKpqucLrmxg33ERCbm9UL4sUR
         h8CUIqW9LXbEDOHw0r1eya7FwAhIrvx8lZQuWL5ZufopJvzuHl45bw8Dy4/5GDZXqP+A
         YpMau8fvu+tD6pN0wC1f1CoX4ORrC4T1kYRxU9vgGa1/0P8jCT8H+iveYIPQ6jVp4a7y
         m60g==
X-Forwarded-Encrypted: i=1; AJvYcCUiESp0xKRUdlWgF2elwtxxr67XMiJwoQZLHZTunvUS1Rocp83apCollwefwIxLqgoPwn+5Sm/wmy+cGb4M@lists.linux.dev
X-Gm-Message-State: AOJu0YzWcjePpP0dZ2cSOYk0u1ibYibjK2tPOu/vIbf0mG//O6FXpfyE
	hrZEpOKLJzrmf9docYJOF4DtqXOhUmKKzCct5z5b54ubFY+2K93dG17nzpFm9wJCXV0=
X-Gm-Gg: ASbGncvfZ7Y/IHocJlnvRsexZKtuj+YnCdqWahW1u1ouzmzyRNEhjX/cmW0pzmfeSL0
	2dVzNwtVgQBhaJrMpUB/YSLjZAsVu/kEWwa1G32bPGb/ApKoBx9on4moRKQv2ArHfwy7Ls5vh8C
	54+2BfPLOMCp0bVmIteLmNX1RS8XnWgmWsDe2V8aR1J+pEH9Etow0r2p2eTe7nbE/FLF2UYBxnx
	GBn1VK5WXKuvXX6wGLEGP8GkrLE4A8B35VLYemOC6ewaqyl6aYQeMCesNabIJJ9XLZgCEAYp9T3
	yTutNq1rISvVFTE7WW1aaFGtWhfpWsZju6IIRx7Sc0H9oPkzjDlMMqzGf4PzqWuYVaJ9Kg==
X-Google-Smtp-Source: AGHT+IGNlF1zWRk96uWanb6ceMhDRXk8o9BVkP04SNj4Cv73ZVCCKgq/Ftq8mRKK3WE38/WIleI/+Q==
X-Received: by 2002:a05:6808:1887:b0:406:72ad:bb6b with SMTP id 5614622812f47-40b33e7da1bmr3836758b6e.37.1751048300543;
        Fri, 27 Jun 2025 11:18:20 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b322b5900sm456205b6e.18.2025.06.27.11.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 11:18:20 -0700 (PDT)
Date: Fri, 27 Jun 2025 21:18:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Manish Kumar <manish1588@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: make g_fbmode[] a read-only pointer
 array
Message-ID: <6059b2f6-4408-41db-8abc-a8a0f38db28e@suswa.mountain>
References: <20250627173120.7639-1-manish1588@gmail.com>
 <c8f5f917-8412-408d-9dd9-6635af8825a7@suswa.mountain>
 <CAAoxDjcYwV9JhRLGJ+opJLEU5j4RHYUt4XZ8E4R9DgF2VqZD8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAoxDjcYwV9JhRLGJ+opJLEU5j4RHYUt4XZ8E4R9DgF2VqZD8Q@mail.gmail.com>

On Fri, Jun 27, 2025 at 11:16:06PM +0530, Manish Kumar wrote:
> Hi Dan,
> 
> Thank you for the review and pointing out the issue. You're right —
> changing the array to `const` makes it unmodifiable, which breaks the
> assignment logic in the driver.
> 
> I've reverted the change and will look for another checkpatch warning to
> address for the next version of the patch.
> 

Awesome.  Thanks.

regards,
dan carpenter

