Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D47E27E05E
	for <linux-staging@lists.linux.dev>; Fri,  8 Aug 2025 14:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754662680; cv=none; b=CQV3SiPPf95HhcFeUw5knhgw1izNwrXgzRoGjmeBpFVKn9J7rxHKFTWLGUuCrWXZ5w1tA6vdVKHVFxZZG97WBL8KIL/je2yNBaB14iyNd0BiIoJIV6/nomeknev1py1lHWgcKQLDCwRqZv/kjU4YOl2RUO4V78k5xKpTHssEFxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754662680; c=relaxed/simple;
	bh=daIX4JK8NK3VHE7qAVQNF+gGHWpHY0OS4ETmy5cXu7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwV8na4ak+fItdGfZ0qNtjmxd6qzYWMiLe3Kx8uYeyuopco7IMxy0HF99scEFa+gmwL8k9eVn3kjrJuPx2hEaJn64CnB++chbEiLDo/EgoPUyl3hM3qJAVSQ6veL/aLZK9DEgNxW/g1zj27xANiAodF770ihLBnN2r5ky8iIv2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ERmb/vXu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ERmb/vXu"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b78127c5d1so1356712f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 08 Aug 2025 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754662677; x=1755267477; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uWZABYiSs8SrBKzKqRb40mOmDVtsHcPHk62yBk6hQeY=;
        b=ERmb/vXuq14h+yPXNZZCyYYW46DpKovSycoNCjIhk8wS7Eu8tFkzv8ViFgJk3a0H65
         9x36ew52Jj1Xzj2CQdnhlQiwJSNQnteNbdkZzPrK7HiTzriGHwTW/ofau+snGYxNyOkv
         CmsJqgejhbySmWd/keQkN/nvlBjDyGj78K0/G01ShZYT8veFDjXfTeoaMvZBaIqk4fUM
         ZsMyzG1KE69abcf3FX9Z4i8ipvIc6x4n88YPAAxeIhBCsh1soLtxWA4kXpwu3VKl4JbY
         LLC0Q8bSyiBU5RpLfFU32IkgPnSWwbVoaWU/m/SlcVXCP2hz86vS/04tZxNDBIUkd8Jk
         U2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754662677; x=1755267477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWZABYiSs8SrBKzKqRb40mOmDVtsHcPHk62yBk6hQeY=;
        b=ktSUUG3eYYlO5AdqHxQOUzDUH1TVlHU+ywyvsCgI+9mU+YdoqL36nl2DHxR/HxJ7MP
         C42H6qgILQGfoQO0W1rYT89H1lXlSRUriWDBW0NDgfWInCyavsDCdUlycB1LU7luqLcu
         0lM26JEe6bhBlkapr5eWvYHOyT+hlnlO0tBWa4aPIPoljzPXlodY0mcr2TUrNiqWR2kt
         lol3lM3g1faWaq8ZvWf3OpKafQ23aMdn9BIP0xmOQqe0V4ROC4CecBGzV+GBOOQbKA3o
         PDgEBvcMUrI0xuy+EGUw6SIj0dbogyhZ88N9JgbB86qwAOEpEJ509I5A2Fr+9m+TO+4T
         YIew==
X-Forwarded-Encrypted: i=1; AJvYcCX57/ZosFICKZRe5nbKl+ww9ZpYSgCIgOz0zNgd+LPCM7dAU98BPW4U+jKJ6PhFaayaW/e+RPE2OPjk7ZeC@lists.linux.dev
X-Gm-Message-State: AOJu0YzfqiwUs0g8NC0JmyE6HJrpoTyFl6ecyx/1NjMwUB7b+poZxlAB
	fsTXmIvcPi1pWntVKMV8HKscOn1Qp+tt08cUKvwPKzOUm4AUA0JiSRopbIKjYg4YNiU=
X-Gm-Gg: ASbGncuZ+53MDWWZQKJ+0gz4rJPoSqyGOmLIM+AxLNf4qflSuE0tt3JHoxgqmTpp7SW
	LF7XdnUQkqgMJt8TkXMsdN7l/Y4dQDgDJPBtqVG9yzvO6A2FsBNUox5dqlMKIvEjKThcWXdW6Fv
	cIBtSuTzzY5bduQFjvE3BJiV+nGsevSKpwPAPyhORo8XX7IWVu1NiQ0FdBLE0jZ2Yq6VvNa7Q9I
	yNdr2O1gARwZ3tCQUhMTYqGSyzyVmV7HlvGaSB4UnUj4w3H0kNMmAEz/sSM2rYRL7eboyVUuKnJ
	NXXM9PDEFCATKIlWPjeMi3fXI1VcSkLFIO7VSK1+e3u83AmTVKKvScCxFqtF84p91bHgXCEwkGP
	KZZJ/KzHhfJeWzJpguUeCKCbuJVg=
X-Google-Smtp-Source: AGHT+IFPPfJMbG/l0hwg3hY9KzR9hWEGIjCDtVw/Wfa9LU/nZh+B3l1yZ8BOL2K2cF+u/tp52PSl0g==
X-Received: by 2002:a05:6000:2308:b0:3a6:d92d:9f7c with SMTP id ffacd0b85a97d-3b9009298a6mr3071537f8f.9.1754662676678;
        Fri, 08 Aug 2025 07:17:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c4a2848sm30099218f8f.71.2025.08.08.07.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 07:17:56 -0700 (PDT)
Date: Fri, 8 Aug 2025 17:17:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Colin King (gmail)" <colin.i.king@gmail.com>
Cc: Yong Zhi <yong.zhi@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"mailing list: linux-media" <linux-media@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: media: staging/intel-ipu3: css - possible typo in array being
 assigned
Message-ID: <aJYHECY1gjZ2xsSP@stanley.mountain>
References: <9b3313da-9cc3-4d3e-b271-05ee36736e4f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b3313da-9cc3-4d3e-b271-05ee36736e4f@gmail.com>

Yeah...  It probably should be the below patch.  The commit message would
say something like:

Subject: Fix copy and paste bug.

This code is copy and pasted from earlier in the function and the NULL
check should be if (p_pl) instead of if (p_tr).  Except that p_pl is
never NULL and the check can be removed.

The impact of this bug is that for several callers the
"p_pl[pl_idx].cfg_set = pl_cfg_set" value is never set.  (I wonder why
this didn't show up in testing?)"

regards,
dan carpenter

diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
index 2c48d57a3180..2d1c38119258 100644
--- a/drivers/staging/media/ipu3/ipu3-css-params.c
+++ b/drivers/staging/media/ipu3/ipu3-css-params.c
@@ -1617,10 +1617,9 @@ imgu_css_acc_process_lines(const struct process_lines *pl,
 				/* Inside the grid */
 				p_pl[pl_idx].lines = process_lines;
 
-			if (p_tr) {
-				p_pl[pl_idx].cfg_set = pl_cfg_set;
-				pl_cfg_set = 1 - pl_cfg_set;
-			}
+			p_pl[pl_idx].cfg_set = pl_cfg_set;
+			pl_cfg_set = 1 - pl_cfg_set;
+
 			pl_idx++;
 		}
 	}
