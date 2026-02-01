Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4EA32D0F0
	for <linux-staging@lists.linux.dev>; Sun,  1 Feb 2026 12:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769949843; cv=none; b=lJiWCEFF0HSr36nxvlOzSd0LEf09F6GvCrYWMueDqguAf/VaACX/ZEi694S9+xTJrx0PetpdWF0EWShu07PbzcMpH1EjJQDvsDHBlvIwG2rAiakdCViYvExgOOaeMGZyXV/c94P/Q6ZZKaYbKkVSkiHnB1RKbzx8VaXqO+R7y2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769949843; c=relaxed/simple;
	bh=WrO0ylJqbgI/DJRKwt76tPD+3Z6g+oduD8IVBAhPIx0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iB6EYZfOQ+/2Y7i/G6hFOUc2JH1+W0B+CFYmEftAjOBl34QqGObyUL51wbKTMVDeR2EndtY0l2SAnRybSDJDBXLjNDr3xEyR6aT7G2UNWxousDIxWKXm6qns+SG/UzDwKXu+8TYnqdmdukA/u+iF3p+N0xegNgOrDnqfs7ZII5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=HqeWWP++; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="HqeWWP++"
Received: from LAPTOP-N070L597.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 32b1f4eb3;
	Sun, 1 Feb 2026 20:43:54 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	hansg@kernel.org,
	hverkuil@kernel.org,
	jianhao.xu@seu.edu.cn,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	zilin@seu.edu.cn
Subject: Re: [PATCH] media: atomisp: Fix memory leak in atomisp_fixed_pattern_table()
Date: Sun,  1 Feb 2026 12:43:52 +0000
Message-Id: <20260201124352.2003313-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026020156-carry-progeny-168c@gregkh>
References: <2026020156-carry-progeny-168c@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c193b2b4f03a1kunm896b8e731b916c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSkgdVhhMS0lPQx4eGksZT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVU
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=HqeWWP++LJxvp4/MIy4C/HWi/tFjXQPlrBlqvie18G4KHIojxxlYSt6BEqPG1/qgfzW/s+8Tl9/78AxwAxFp+hJzMFyBFzNHmBM6rncChdg3U+C+YVA7t/1lmpKYe2zug35rOjovPXSGfmg+pysUv3XEGrAaIeLxA+1qdhAnf5A=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=z+Ksi1oqV5CFNRyDJ2AS3ue2A9LqgtMK61xYAi12Vt4=;
	h=date:mime-version:subject:message-id:from;

On Sun, Feb 01, 2026 at 09:10:12AM +0100, Greg KH wrote:
> On Sun, Feb 01, 2026 at 07:21:07AM +0000, Zilin Guan wrote:
> > atomisp_v4l2_framebuffer_to_css_frame() allocates memory for
> > raw_black_frame, which must be released via ia_css_frame_free().
> > However, if sh_css_set_black_frame() fails, the function returns
> > immediately without performing this cleanup, leading to a memory leak.
> > 
> > Fix this by assigning the error code to ret and allowing the code to
> > fall through to the ia_css_frame_free() call.
> > 
> > Compile tested only. Issue found using a prototype static analysis tool
> > and code review.
> 
> Please properly document this as per the rules we have for using tools
> like this.
> 
> thanks,
> 
> greg k-h

My apologies for the overly brief description regarding the tool and 
testing. I will follow the rules and provide a V2 patch with a properly 
documented commit message.

Best regards,
Zilin Guan
