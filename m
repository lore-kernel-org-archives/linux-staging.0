Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9B370
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 07:26:30 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1576vAnH006815;
	Mon, 7 Jun 2021 06:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=/9lh0gmM4r3gZ2y+3t8XvzHivwRXZGOKWKHXzaPSY28=;
 b=i8MnuZ00caSAKChYV/0lJwSZQXP/Nh/pnG/2GuHTPoeREMdiz9QhICvAgukVXGz5UKN9
 dmvbjatuPqbwYkgw+00JuuYX3qIDYkyQBCzEyFB9Bxf7xA52TmJhIeX4wWwJg2uqZG3H
 vq43WHAf57i6DZLI4qsdcEBIaeHfnJgm8et2/Xccrl+yqXOM/MKndCvn9V46mCU8FS3p
 pCk0Wf5Cfj9osih/8MBhAEuvZuTik8QNc+WKrZqKFLKiBizYzaSVovkiBQFl/Gf+pQLN
 qcXQ16+Dj8h6xvR64h7bm5Q/NMD3VyQFzobc7hkLGRYm06aK6ThgrswvqLnMoFVvYbuj 7A== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3916m08480-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jun 2021 06:59:43 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
	by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 1576tTxK103479;
	Mon, 7 Jun 2021 06:59:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3030.oracle.com with ESMTP id 38yya9w23e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jun 2021 06:59:42 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1576t32t102250;
	Mon, 7 Jun 2021 06:59:42 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3030.oracle.com with ESMTP id 38yya9w236-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jun 2021 06:59:41 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 1576xelP014981;
	Mon, 7 Jun 2021 06:59:41 GMT
Received: from kadam (/41.212.42.34)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 07 Jun 2021 06:59:40 +0000
Date: Mon, 7 Jun 2021 09:59:34 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, neil@brown.name
Subject: Re: [PATCH 5/5] staging: mt7621-pci: parse some dt properties from
 root port child nodes
Message-ID: <20210607065934.GM1955@kadam>
References: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
 <20210605073023.21435-6-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210605073023.21435-6-sergio.paracuellos@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: JUMXHpECI4BPNTcOmqRB9IhBsUtBFqFS
X-Proofpoint-GUID: JUMXHpECI4BPNTcOmqRB9IhBsUtBFqFS

On Sat, Jun 05, 2021 at 09:30:23AM +0200, Sergio Paracuellos wrote:
> Properties 'clocks', 'resets' and 'phys' have been moved from parent
> node to the root port childs. Hence we have to adapt the way device
> tree is parsed in driver code to properly align things and make all
> the stuff work.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

It sounds like this commit needs a fixes tag?  What does "to properly
align things and make all the stuff work." in terms of what the user
sees?

regards,
dan carpenter

