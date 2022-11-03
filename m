Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C53A31;
	Thu,  3 Nov 2022 07:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667460435; bh=ZaXYFmLXWsMi7kNj6g7178734pMvEJ6Lz2L2Bc9KYcM=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=oqfbGD+rxr+PEFg/GEJZnPD/0zKapH+9fiLLfzPpGNYpBcn0PY3fKHVyEKw66laHv
	 Qwo539L5SGqS3vn8eevb8RyUixVAGQy/QUH2u2b52+/Le+BsAn+eYJLHd9ZrYWdjzW
	 TFKpvF+fDXElxWlJ1Xc7W+l5rHGFBuFP49SwOkKU=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Thu,  3 Nov 2022 08:27:15 +0100 (CET)
X-EA-Auth: 1C2lZXt0cX05DonxAPqvbQLj2ZH3ORBoy6pOP51zkhWHzVKWGt62eo4hwELyz8uFeNvyCwvQ5Qj2/hYRbbPz4VyQZ7/LoXqC
Date: Thu, 3 Nov 2022 12:57:09 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: staging: emxx_udc question on i_write_length datatype
Message-ID: <Y2NtTXwMef0kp01s@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,
While reviewing this [1] coccicheck warning, I observed something that concerned
me. The variable i_write_length is declared to be of u32 type. Later it is
assigned a value DMA_MAX_COUNT * mpkt; which is 256 * u32;

I am unable to estimate if mpkt (or max packet size) can attain value greater
than 16777215 in which case the result will overflow the 32 bits of
i_write_length. Is it safe to make i_write_length to be a u64?

[1] drivers/staging/emxx_udc/emxx_udc.c:1007:28-29: WARNING opportunity for min()


