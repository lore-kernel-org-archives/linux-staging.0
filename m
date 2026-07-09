Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397BC403EB2
	for <linux-staging@lists.linux.dev>; Thu,  9 Jul 2026 10:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783594361; cv=none; b=GmTPN7iKiBKbZPIEpMqg6nOBbqVTJztuYyR9bdMJW6sbdociJKlcEGoLNTWduxasDroqnHHY3fKY1XGAmY90GLFOechj1B5gzBiWOpdDUe08lWM3CGqMASrUh2ozAAYDyafQrsYyh/QBcfbAREbH2Zy6n/JBKqRnVA41ynZSJQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783594361; c=relaxed/simple;
	bh=tT+rsXtyCwdK9hnBUqWrLDMFJQTbKewUwmQ5pI7i0gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7jk+CuFGBfu5LS3TNArSqJL1dW4K3RBzbwIAHce1DB2QxHgDqcSHay4bZbyU7S//tGMkLoDzB6tBSPc30VaU8bmVqy6HReT5sLJFUhc6rBXFBIOLtvWqijWBd5Mx+2DU9ZjmZJGd9GFDQ+7DC/7pvbN/XtAdbhY8IBihgZyiYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNeHNS1n; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNeHNS1n"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6a1840edbabso383208eaf.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Jul 2026 03:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783594355; x=1784199155; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QG9Jt3raC9zxX2MSD3KhQhG4RBmV8v+5QIW1bbTsOTs=;
        b=cNeHNS1nrU5On7UozonUUoThZZFlAEqgiynCRNIOTbGDAtlv+Hj7luEoPqdTMBzLTx
         NtNxuE/G1lFCAM/DRrDutGzRZtiwb7p9+wJCMyYv6cdh5BdFXf4Jrr6YDVykn+IJwnJt
         HRK23SspRldvivq2yh8oLPvQdA6Ryp9X1JVfcg0rGUx2d3po+G+mcDXId3PPmpa1jr3p
         laDoBcAGks1u/5zGA5VH9Ppg5LiT41Un9bIdAQIZFZCOdnF5EjFpvXyyRNeTLuMqPjE0
         3+mryd/orLxDL/R2olzpAZVPTmnn9GZTq+/afeSFsxlR6Q1oL14CWwGatHLsYV+47XvD
         jNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783594355; x=1784199155;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QG9Jt3raC9zxX2MSD3KhQhG4RBmV8v+5QIW1bbTsOTs=;
        b=P2EHtoNucrLKLi/sJHbHOjFh8VmmIeVnlIa4zEtVBKxU32yppM7lMy3Dvx0u1RumS1
         yLE9QlcX/zu/qq6OIzL1ItjvXr2RZgk+68V1QswO7BoWVjDEc3mAdm+lHrIoGmqzdAaD
         Q4Q+/+wMNuiSL5BQ2Qg4wjzYrZCfidse9osj8qjmyjGJI0t7Xg+4M7sikXkBjj4sPpRl
         ZDJVhkMyjl77Uv00Px/p9OSxz0cG1RvIWtSsBAoMI0nn6kQbsbqcBU1K8II4HmjSYY22
         csf3y1MYpUB8BgWipxseEeBF8Z8u1GgTNKbGVWbmnNfF0eaadJyihJkQ9Q6q8RYbJVa7
         qrgg==
X-Forwarded-Encrypted: i=1; AFNElJ+dw4hkiI06uW2pyJM95FIvpKiFTAOCnrC5/rloeeCP3bu46q7cai82O55ZT3+Vnl++nkSSL4rQDFDrCprZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6qcnCgLK8HJmchNoFZiHwjrG4SRrONFkJ8+iyYhDcQmFCt8a/
	nKRVfWzTZQGC7n4AESQskJd8V6QDFvjs5KNEcD37oiliRUqDzjYjhDKn
X-Gm-Gg: AfdE7cnDn1dZ24W9ZJMFrGH925sXeTT0oibLngI3aWNaf5Jj4SVB5Utj5UeGT1mja4t
	0NIlHkza3yywVYOkm9acL1OpXsL7g2Vc4oBZGvJANm7MtkumPekRokLIZI3bxpJX3lESPu5Q9cn
	WvCjFeNe+qJDQBHKubhxFfz9xXH2qgu6kFvmCgfg2eSaYhMiqqiJSsjh+Pbd56qp9LtHPdp5sIh
	6JdV4aq28S/Bd6zvn5vfFC8uvuB/Z+FRsTrt/hkJ6/27pY2gl0zmqDvCUbc2KSeN+u8rS58RSRx
	fn9Fp10cI/EMwsPED5dddEj9gfW15DZyEuxvWL6oGMkpilRc8wcngldFvta1U3MlF/YInHk6pdG
	UMMNuGo2f+FcQHxNHRONYWjVe+mPVFT3i1yB5vB1C6FeBsznk8/ciE6SPwig0dnZq5RF8Pz3HN/
	hxFKgH
X-Received: by 2002:a05:6820:1ca8:b0:6a3:68f8:69e5 with SMTP id 006d021491bc7-6a37d88343amr1884175eaf.13.1783594355599;
        Thu, 09 Jul 2026 03:52:35 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519124d07dsm1652855fac.2.2026.07.09.03.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:52:34 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:52:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hao-Qun Huang <alvinhuang0603@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: hid: fix SET_REPORT return value
Message-ID: <ak99bENMWC8saJL4@stanley.mountain>
References: <20260704081613.434445-1-alvinhuang0603@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704081613.434445-1-alvinhuang0603@gmail.com>

On Sat, Jul 04, 2026 at 04:16:13PM +0800, Hao-Qun Huang wrote:
> __gb_hid_output_raw_report() stores the result of gb_hid_set_report()
> in ret and even adjusts it to account for the report ID byte, but then
> always returns 0.
> 
> This hides Greybus transport errors from HID_REQ_SET_REPORT callers,
> and makes hidraw report zero bytes written to user space on success,
> although hid_hw_raw_request() is expected to return the number of
> bytes transferred or a negative errno. The sibling GET_REPORT path,
> __gb_hid_get_raw_report(), already follows this convention.
> 
> Return ret like the other HID transport drivers do.
> 
> Fixes: 96eab779e198 ("greybus: hid: add HID class driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
> ---

These kinds of changes require testing.  How have you tested this
change?

regards,
dan carpenter

