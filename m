Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECF420302
	for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 16:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eb0gK0lO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CSA+MadG"
Date: Wed, 11 Oct 2023 18:39:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1697042379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=czixzo5H9lrjEHVPwiEdlDlSNtg3PpSgksRzgfHxAZM=;
	b=eb0gK0lO3rROe0IazF7YQ2QFB/Wsv0rWb21m5CPj6GyANhjJUJIGb8FW2Gnh6AhX9vYME5
	ERpefIHHy/kkcx/9kX0KLmLydNCf0cNz87UQnMtKDLeaxoNbC6EcyZ8/b+RtZ9rzXT5K5P
	OXDO9jF1y+XZ3131MwlirKjdkUZB3UL12hnFlWuyWTvLvnZmk4iGDGxkSyeBSQSf9Zq38A
	k4rz68BhsNDLaE16CzMEKCz3YLXamvqtODn4I7iWymv5fTwpvw3juZzwPrnxmdb7GIluUV
	1t8M2nixQvmo1bEVSILOMIr8ay2hWlpeyIENZi4whaB3HE52ioRAYtVimXM16w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1697042379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=czixzo5H9lrjEHVPwiEdlDlSNtg3PpSgksRzgfHxAZM=;
	b=CSA+MadGLden/zwcuWGafYowEObjjFT66utIWMQqsCT60byJ/kf8vjjE3lWxaYNZykrSIj
	vBaCiP2fMPbAVbDg==
From: Nam Cao <namcao@linutronix.de>
To: drosdeck <edson.drosdeck@gmail.com>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs:Fix coding style errors and warning
Message-ID: <20231011163937.WfJrCwdP@linutronix.de>
References: <20231011164232.28866-1-edson.drosdeck@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011164232.28866-1-edson.drosdeck@gmail.com>

On Wed, Oct 11, 2023 at 01:42:32PM -0300, drosdeck wrote:
> Warning found by checkpatch.pl script. Fixes warning replacing printk to
> pr_crit and fixes conding style.
> 
> Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>

You are doing too many different things in a single commit. Try
splitting them up: 1 commit change printk -> pr_crit, 1 commit add
brackets, etc.

Best regards,
Nam
