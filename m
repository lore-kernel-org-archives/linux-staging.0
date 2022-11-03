Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724007E2;
	Thu,  3 Nov 2022 05:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667453154; bh=FufVo+HFMo3MVhvPeLvfq/RyBj3cNiGx245dUoTqmJU=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=iBJlL+mWHsrh7x0N3fKFFXMMBUXy3LhUUEQZyMU5qJyUejZsVMc7B2plh/3MTU6wr
	 RYgzTYyKeFMNqsmkiKBoy0VCYcoQ4PU0+WHOFTuuJ/xAhaj9E6/l0cTsI+JeupeRoW
	 aof5rObKL/8Uuhq3I9/hUlgoU5qMlPI/bXGrT+UU=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
	via [213.182.55.206]
	Thu,  3 Nov 2022 06:25:53 +0100 (CET)
X-EA-Auth: sT/AI6qkYYmy785Y8+YqN/cDQZl5Q7Pej6Ql4n93P4imGzzGbUN3YjFwvbY6p7yflJ+0rjGD1TILhqpBL7JIsLea1C8jlblu
Date: Thu, 3 Nov 2022 10:55:47 +0530
From: Deepak R Varma <drv@mailo.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Pavel Skripkin <paskripkin@gmail.com>, outreachy@lists.linux.dev,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Use flexible-array for one length
 array member
Message-ID: <Y2NQ23peeelHrCqW@qemulion>
References: <Y1vRivFfRD6VoBt/@ubunlion>
 <642519a2-664d-d837-983a-1d5bbc72a25e@gmail.com>
 <Y1vjKtM9druO2bSN@ubunlion>
 <Y1vqd/ij5WqcL3Qe@kadam>
 <Y2LCykj5Ntx7yHxu@qemulion>
 <Y2NQBgUdNPB7g0Tf@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2NQBgUdNPB7g0Tf@kadam>

On Thu, Nov 03, 2022 at 08:22:14AM +0300, Dan Carpenter wrote:
> On Thu, Nov 03, 2022 at 12:49:38AM +0530, Deepak R Varma wrote:
> > I am wondering if ijk_matrix_regs_set (or IQKMatrixRegSetting) is a one element
> > array, why is it declared as a two dimensional array? Can this be a simple one
> > dimensional array instead? Is this the cleanup you are referring to when you say
> > "code is messy and should be cleaned up"?
>
> Yes.  You have interpreted that correctly.

Thank you for the confirmation. This will be an interesting correction. I will
review and submit a patch shortly.

Thank you,
./drv

>
> regards,
> dan carpenter
>
>


