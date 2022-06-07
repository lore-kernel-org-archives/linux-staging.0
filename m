Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545BB7C
	for <linux-staging@lists.linux.dev>; Tue,  7 Jun 2022 13:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54890C385A5;
	Tue,  7 Jun 2022 13:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654607757;
	bh=2fb486ZWcuFaA673rIFGIDVqeQ4KrWj/5hmN64DTg5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbDY8ELhIJHTk7l01bZEhx5U3OvN4mEqXxZACXGGdb7Ua4VqOsJfY0/Y8M3zUWIKj
	 pDeO/PVz5aNXgc6H1b9PW1vydVXHPcEWmPU+XC7Btz4YDtRAmtfFG/j23Q9V9xqyM1
	 CYcVINYHtril6QuBJlZJdIcWghkwy7LmA1Wel7to=
Date: Tue, 7 Jun 2022 15:15:51 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Paris Andrea <aparis@student.ethz.ch>
Cc: "Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
	"phil@philpotter.co.uk" <phil@philpotter.co.uk>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: r8188eu: remove multiple blank lines
Message-ID: <Yp9PhzQlQG36lx9L@kroah.com>
References: <a547d8a1b1914a86a35c488160f8c833@student.ethz.ch>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a547d8a1b1914a86a35c488160f8c833@student.ethz.ch>

On Tue, Jun 07, 2022 at 01:14:22PM +0000, Paris  Andrea wrote:
> This patch removes three blank lines after a variable declaration in the file rtw_cmd.c
> in order to fix the three related checkpatch warnings.

That is not what this commit does :(

