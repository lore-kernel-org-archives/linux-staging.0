Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AD64C7A
	for <linux-staging@lists.linux.dev>; Fri, 15 Jul 2022 20:16:07 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1oCRjG-0006Zz-Rp; Fri, 15 Jul 2022 22:16:02 +0200
Date: Fri, 15 Jul 2022 22:16:02 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: r8188eu: remove SetHwReg8188EU()
Message-ID: <20220715201602.bnmexv2uzmnkusjf@viti.kaiser.cx>
References: <20220715062908.8547-1-straube.linux@gmail.com>
 <20220715062908.8547-6-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715062908.8547-6-straube.linux@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Michael,

Thus wrote Michael Straube (straube.linux@gmail.com):

> Remove the case HW_VAR_CORRECT_TSF from SetHwReg8188EU() and move the
> functionality to the function that calls SetHwReg8188EU() with
> HW_VAR_CORRECT_TSF. SetHwReg8188EU() is empty now and we can finally
> remove it.

nice work :-)

For the whole series:
Tested-by: Martin Kaiser <martin@kaiser.cx>
